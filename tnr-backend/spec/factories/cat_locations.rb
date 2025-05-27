FactoryBot.define do
  factory :cat_location do
    cat { nil }
    location { nil }
    first_seen { "2025-05-27 00:29:43" }
    last_seen { "2025-05-27 00:29:43" }
    notes { "MyText" }
  end
end
