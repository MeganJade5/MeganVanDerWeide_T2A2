FactoryBot.define do
  factory :listing do
    title { "MyString" }
    cuisine { "MyString" }
    description { nil }
    allergy { "MyString" }
    price { 1 }
    available_date { "MyString" }
    sold { false }
  end
end
