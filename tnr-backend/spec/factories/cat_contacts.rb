FactoryBot.define do
  factory :cat_contact do
    cat { nil }
    contact { nil }
    relationship_type { "MyString" }
  end
end
