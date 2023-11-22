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

Given /^the following states exist:$/ do |table|
  table.hashes.each do |row|
    State.create!(name: row['name'], symbol: row['symbol'], fips_code: row['fips_code'], is_territory: row['is_territory'], lat_min: row['lat_min'], lat_max: row['lat_max'], long_min: row['long_min'], long_max: row['long_max'])
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
  expect {
    Event.create(name: name, county: county, start_time: 1.day.ago, end_time: Time.zone.now + 1.week)
  }.to_not change(Event, :count)
end

When /^I try to create an event "([^"]*)" in "([^"]*)" with an end time before its start time$/ do |name, county_name|
  county = County.find_by(name: county_name)
  expect {
    Event.create(name: name, county: county, start_time: Time.zone.now + 1.week, end_time: Time.zone.now)
  }.to_not change(Event, :count)
end

Then /^the event should not be saved due to invalid (start|end) time$/ do |_|
  # The steps above already include the expectation that the record count does not change
end
