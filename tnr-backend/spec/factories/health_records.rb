FactoryBot.define do
  factory :health_record do
    cat { nil }
    visit_date { "2025-05-27 00:30:02" }
    veterinarian { "MyString" }
    notes { "MyText" }
    treatment { "MyText" }
    cost { "9.99" }
  end
end
