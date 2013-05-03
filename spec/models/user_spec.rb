# encoding : utf-8
require 'spec_helper'

describe User do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:password) }

  describe ".authenticate" do
    let(:attrs) {
      {
        :email => "zekitow@gmail.com",
        :name => "José Ribeiro",
        :password => "123456",
        :password_confirmation => "123456"
      }
    }

    before(:all) { User.new(attrs).save }
    after(:all)  { User.delete_all }

    context "when user and password is valid" do
      subject { User.authenticate('zekitow@gmail.com','123456') }
      it { should_not be_nil }
    end

    context "when user and password is invalid" do
      subject { User.authenticate('zekitow@gmail.com.br','xxxxx') }
      it { should be_nil }
    end
  end
end
