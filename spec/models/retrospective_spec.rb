# encoding : utf-8
require 'spec_helper'

describe Retrospective do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user_id) }
end
