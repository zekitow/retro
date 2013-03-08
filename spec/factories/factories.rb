# encoding : utf-8
require 'factory_girl'

FactoryGirl.define do
  factory :user do
    id                    123456
    email                 'zekitow@gmail.com'
    name                  'José Ribeiro'
    password              '123456'
    password_confirmation '123456'
  end

  factory :retrospective do
    name 'Sprint# 1 - Mastering on Grosela'
  end

  factory :invalid_retrospective, parent: :retrospective do
    name nil
  end
end
