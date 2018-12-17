require 'rails_helper'

RSpec.describe Organization, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:employees) }

    it { should have_many(:assignments) }

    end

    describe "InDirect Associations" do

    it { should have_many(:matters) }

    it { should have_many(:users) }

    end

    describe "Validations" do
      
    end
end
