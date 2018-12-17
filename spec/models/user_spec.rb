require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:employees) }

    it { should have_many(:assignments) }

    end

    describe "InDirect Associations" do

    it { should have_many(:matters) }

    it { should have_many(:organizations) }

    end

    describe "Validations" do
      
    end
end
