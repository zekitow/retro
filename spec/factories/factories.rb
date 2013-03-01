# encoding : utf-8
require 'factory_girl'

FactoryGirl.define do
  factory :user do
    email                 "zekitow@gmail.com"
    name                  "José Ribeiro"
    password              "123456"
    password_confirmation "123456"
  end
end
