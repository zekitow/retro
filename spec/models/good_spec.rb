# encoding : utf-8
require 'spec_helper'

describe Good do
  it { should validate_presence_of(:description) }
end