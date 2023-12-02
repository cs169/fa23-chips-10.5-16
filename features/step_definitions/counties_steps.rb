# frozen_string_literal: true

When /I click on ([a-zA-Z\s]*) County/ do |name|
  find('path.actionmap-view-region').find("#{name} County").click
end
