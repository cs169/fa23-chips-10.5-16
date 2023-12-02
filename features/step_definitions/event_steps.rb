# frozen_string_literal: true

# features/step_definitions/event_steps.rb

# Helper method to parse natural language date expressions
def parse_time_expression(expression)
  case expression
  when 'one week from now'
    1.week.from_now
  when 'one week and 5 hours from now'
    1.week.from_now + 5.hours
  when 'two weeks from now'
    2.weeks.from_now
  when 'two weeks and 3 days from now'
    2.weeks.from_now + 3.days
  else
    raise "Time expression not recognized: #{expression}"
  end
end

# Additional Helper method to convert string to boolean
def to_boolean(str)
  str == 'true'
end

Given /^the following states exist:$/ do |table|
  table.hashes.each do |row|
    State.create!(name: row['name'], symbol: row['symbol'], fips_code: row['fips_code'],
                  is_territory: row['is_territory'], lat_min: row['lat_min'], lat_max: row['lat_max'], long_min: row['long_min'], long_max: row['long_max'])
  end
end

Given /^the following counties exist:$/ do |table|
  table.hashes.each do |row|
    state = State.find_by(name: row['state'])
    County.create!(name: row['name'], state: state, fips_code: row['fips_code'], fips_class: row['fips_class'])
  end
end

Given /^the following events exist:$/ do |table|
  table.hashes.each do |row|
    county = County.find_by(name: row['county'])
    start_time = parse_time_expression(row['start_time'])
    end_time = parse_time_expression(row['end_time'])
    Event.create!(name: row['name'], county: county, start_time: start_time, end_time: end_time)
  end
end

When /^I try to create an event "([^"]*)" in "([^"]*)" with a start time in the past$/ do |name, county_name|
  county = County.find_by(name: county_name)
  expect do
    Event.create(name: name, county: county, start_time: 1.day.ago, end_time: Time.zone.now + 1.week)
  end.to_not change(Event, :count)
end

When /^I try to create an event "([^"]*)" in "([^"]*)" with an end time before its start time$/ do |name, county_name|
  county = County.find_by(name: county_name)
  expect do
    Event.create(name: name, county: county, start_time: Time.zone.now + 1.week, end_time: Time.zone.now)
  end.to_not change(Event, :count)
end

Then /^the event should not be saved due to invalid (start|end) time$/ do |_|
  # The steps above already include the expectation that the record count does not change
end

# New Step Definitions

Given /^the state "([^"]*)" exists$/ do |state_name|
  State.create!(name: state_name, symbol: state_name[0..1].upcase, fips_code: Random.rand(1..99), is_territory: false,
                lat_min: 30, lat_max: 50, long_min: -120, long_max: -70)
end

Given /^I filter events by state "([^"]*)"$/ do |state_symbol|
  visit events_path('filter-by' => 'state-only', 'state' => state_symbol)
end

Then /^I should see events from county "([^"]*)"$/ do |county_name|
  expect(page).to have_content(Event.where(county: County.find_by(name: county_name)).map(&:name).join(' '))
end

Then /^I should not see events from county "([^"]*)"$/ do |county_name|
  expect(page).to_not have_content(Event.where(county: County.find_by(name: county_name)).map(&:name).join(' '))
end

# Additional scenarios to test event creation with various conditions
When /^I try to create an event with ([^"]*) name$/ do |name_condition|
  name = name_condition == 'empty' ? '' : 'Sample Event'
  county = County.first
  if name_condition == 'empty'
    expect do
      Event.create(name: name, county: county, start_time: Time.zone.now + 1.week, end_time: Time.zone.now + 2.weeks)
    end.to_not change(Event, :count)
  end
end

Then /^the event should not be saved due to invalid name$/ do
  expect(Event.where(name: '')).to be_empty
end

# Additional step definitions needed for the above scenarios would include:
Then /^I should see an event named "([^"]*)"$/ do |event_name|
  expect(page).to have_content(event_name)
end

Then /^I should see an event with a 255-character name$/ do
  expect(Event.where('LENGTH(name) = 255')).to exist
end

When /^I try to create an event with empty name$/ do
  county = County.first
  @event = Event.new(name: '', county: county, start_time: 1.week.from_now, end_time: 2.weeks.from_now)
  @event.save
end

Then /^the event should not be saved due to invalid name$/ do
  expect(@event.persisted?).to be false
  expect(@event.errors[:name]).to include("can't be blank")
end
