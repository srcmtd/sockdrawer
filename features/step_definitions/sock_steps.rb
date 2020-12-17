# frozen_string_literal: true

Given('a Sock codenamed {string}') do |string|
  create(:sock, code_name: string)
end

When('I visit the socks page') do
  visit socks_path
end

Then('I should see {string}') do |string|
  expect(page).to have_content(string)
end
