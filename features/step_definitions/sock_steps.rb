# frozen_string_literal: true

Given('a Sock codenamed {string}') do |string|
  @sock = create(:sock, code_name: string)
end

When('I visit the socks page') do
  visit socks_path
end

When("I visit that sock's page") do
  visit sock_path(@sock)
end

When("I edit that Sock") do
  visit edit_sock_path(@sock)
end

Then('I should see {string}') do |string|
  expect(page).to have_content(string)
end
