# encoding : utf-8
require 'spec_helper'

describe Bad do
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:action) }
end