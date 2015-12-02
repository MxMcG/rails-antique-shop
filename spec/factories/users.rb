FactoryGirl.define do
  factory :admin, :class => 'Admin' do
    email "max@max.com"
    password '12345678'
    password_confirmation '12345678'
  end
end