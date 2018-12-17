require 'rails_helper'

RSpec.describe Transaction, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:asset) }

    end

    describe "InDirect Associations" do

    it { should have_one(:matter) }

    end

    describe "Validations" do
      
    end
end
