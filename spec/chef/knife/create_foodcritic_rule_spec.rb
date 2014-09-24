require_relative '../spec_helper'

require 'chef/knife/create_foodcritic_rule'

describe Knife::FoodcriticRuleCreate do

    before(:each) do
        @knife = Knife::FoodcriticRuleCreate.new
        @knife.config = {}
        @stdout = StringIO.new
        @knife.stub(:stdout).and_return(@stdout)
    end

    describe 'run' do

        it 'should show usage if there is no rule ID' do
          @knife.config = {}
          @knife.name_args = []
          @knife.ui.should_receive(:fatal).with('You must specify a rule ID (eg. CUSTOM001)')
          -> { @knife.run }.should raise_error SystemExit
        end

    end

end