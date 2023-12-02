Given("the following representatives exist:") do |table|
  table.hashes.each do |row|
    Representative.create!(name: row['name'])
  end
end

Given("the following news items exist:") do |table|
  table.hashes.each do |row|
    NewsItem.create!(title: row['title'], description: row['description'])
  end
end


Given("I am on the edit news item page for {string}") do |title|
  news_item = NewsItem.find_by(title: title)
  visit edit_news_item_path(news_item)
end

Given("I am on the news items page") do
  visit news_items_path
end


When("I select {string} from {string}") do |value, field|
  select value, from: field
end

When("I press {string}") do |button|
  click_button button
end

Then("I should see {string}") do |text|
  expect(page).to have_content(text)
end

Then("I should not see {string}") do |text|
  expect(page).not_to have_content(text)
end

Given("I have a news item titled {string}") do |title|
  expect(NewsItem.find_by(title: title)).not_to be_nil
end

Then("the news item should have {string} as representative") do |rep_name|
  news_item = NewsItem.last
  expect(news_item.representative.name).to eq(rep_name)
end

Then("the news item should have {string} as issue") do |issue|
  news_item = NewsItem.last
  expect(news_item.issue).to eq(issue)
end
