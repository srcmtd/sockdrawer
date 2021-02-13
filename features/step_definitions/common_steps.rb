When('I fill in Notes with {string}') do |value|
  find("trix-editor#sock_notes").set(value)
end

When('I fill in {string} with {string}') do |field, value|
  fill_in(field, with: value)
end

When('I click {string}') do |title|
  click_on(title)
end
