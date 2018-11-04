FactoryBot.define do
  factory :user do
    email                 { 'whatever@example.com' }
    password              { 'password' }
    password_confirmation { 'password' }
  end
end
