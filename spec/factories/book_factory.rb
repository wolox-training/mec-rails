require 'faker'
FactoryBot.define do
  factory :book do
    genre { Faker::Book.genre }
    author { Faker::Book.author }
    image { Faker::File.file_name('path/to') }
    title { Faker::Book.title }
    editor { Faker::Book.publisher }
    year { Faker::Number.number(4) }
  end
end
