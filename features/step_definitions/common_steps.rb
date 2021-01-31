When('I fill in {string} with {string}') do |field, value|
  fill_in(field, with: value)
end

When('I click {string}') do |title|
  click_on(title)
end
