require 'rails_helper'

RSpec.describe Matter, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:matter_joins) }

    it { should have_many(:assets) }

    end

    describe "InDirect Associations" do

    it { should have_many(:users) }

    it { should have_many(:transactions) }

    it { should have_many(:asset_values) }

    it { should have_many(:organizations) }

    end

    describe "Validations" do
      
    end
end
