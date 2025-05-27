FactoryBot.define do
  factory :cat do
    name { "MyString" }
    age { 1 }
    gender { "MyString" }
    color { "MyString" }
    description { "MyText" }
    status { "MyString" }
    spayed_neutered { false }
    microchipped { false }
    health_notes { "MyText" }
  end
end
