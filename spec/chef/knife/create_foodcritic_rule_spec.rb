require_relative '../../spec_helper'

require 'fakefs/spec_helpers'
require 'chef/knife/create_foodcritic_rule'

describe Knife::FoodcriticRuleCreate do
    include FakeFS::SpecHelpers

    before(:each) do
        @knife = Knife::FoodcriticRuleCreate.new
        @knife.config = {}
        @knife.name_args = ['TEST001']
        @stdout = StringIO.new
        @knife.stub(:stdout).and_return(@stdout)
        @foodcritic_path = File.expand_path("./foodcritic")
    end

    describe 'run' do

        it 'should show usage if there is no rule ID' do
          @knife.config = {}
          @knife.name_args = []
          @knife.ui.should_receive(:fatal).with('You must specify a rule ID (eg. CUSTOM001)')
          -> { @knife.run }.should raise_error SystemExit
        end

        it 'should create a new cookbook' do
          @knife.should_receive(:create_cookbook).with(@foodcritic_path, 'TEST001')
          @knife.run
        end

    end

end