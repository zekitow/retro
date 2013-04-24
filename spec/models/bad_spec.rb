# encoding : utf-8
require 'spec_helper'

describe Bad do

  describe 'fields' do
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:action) }
    it { should validate_presence_of(:times_being_kept) }
  end

  describe 'times_being_kept' do
    let (:desc) { "any description" }
    let (:bad)  { Bad.new(:description => desc) }
    subject     { bad.times_being_kept }

    it 'should not be recurrent just after creation' do
      subject.should eq 0
    end
  end

  describe 'keep!' do
    let (:desc) { "any description" }
    let (:bad)  { Bad.new(:description => desc) }
    subject     { bad.keep! }

    context 'when its being kept by the first time' do
      before    { bad.times_being_kept = 0 }

      it 'should increase times_being_kept' do
        subject
        bad.times_being_kept.should eq 1
      end

      it 'should not be solved' do
        subject
        bad.solved.should be_false
      end

      it 'should add preffix to description' do
        subject
        bad.description.should eq "Recorrente: " + desc.to_str
      end
    end

    context 'when its being kept by the third time' do
      let (:desc) { "Recorrente: any description" }
      before      { bad.times_being_kept = 3 }

      it 'should increase times_being_kept' do
        subject
        bad.times_being_kept.should eq 4
      end

      it 'should not be solved' do
        subject
        bad.solved.should be_false
      end

      it 'should NOT add preffix to description' do
        subject
        bad.description.should eq desc
      end
    end

    context 'when description is nil' do
      let (:desc) { nil }

      it 'should return nil' do
        subject.should eq nil
      end
   end
  end
end
