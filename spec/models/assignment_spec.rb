require 'rails_helper'

RSpec.describe Assignment, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:organization) }

    it { should belong_to(:matter) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
