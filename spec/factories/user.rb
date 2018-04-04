FactoryBot.define do
  factory :user do
    email "test@test.com"
    password "testtest"
    first_name "test"
    last_name "test"
  end

  factory :bad_account, class: User do
    email "test@test.com"
    password "testtest"
    first_name "test"
    last_name "test"
  end
end