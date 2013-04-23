# encoding : utf-8
require 'spec_helper'

describe Bad do
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:action) }

  describe 'preffix_description!' do
    let (:desc) { "any description" }
    let (:bad)  { Bad.new(:description => desc) }
    subject     { bad.preffix_description! }

    it 'should add preffix to description' do
      subject.should eq "Recorrente: " + desc.to_str
    end

    context 'when description is nil' do
      let (:desc) { nil }

      it 'should return nil' do
        subject.should eq nil
      end
    end
  end
end
