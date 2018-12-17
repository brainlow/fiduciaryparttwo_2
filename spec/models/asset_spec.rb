require 'rails_helper'

RSpec.describe Asset, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:asset_values) }

    it { should have_many(:transactions) }

    it { should belong_to(:matter) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
