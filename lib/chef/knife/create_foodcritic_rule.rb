require 'chef/knife'
require 'chef/knife/cookbook_create'

module Foodcritic
  class FoodcriticRuleCreate < Chef::Knife

    banner "knife foodcritic rule create"

      option :foodcritic_desc,
      :short => '-r VALUE',
      :long => '--description VALUE',
      :default => "A very nice rule",
      :description => "What the rule is checking for"
      

    def run

      unless name_args.size == 1
        puts "You need to name the rule (eg. FOURTH004)"
        show_usage
        exit 1
      end

      foodcritic_path = File.expand_path("./foodcritic")
      ruleID = name_args.first
      ruleDesc = config[:foodcritic_desc]

      create_foodcritic_rule(foodcritic_path, ruleID, ruleDesc)
      create_specs(foodcritic_path, ruleID)
      create_cookbook(foodcritic_path, ruleID)
      
    end

    def create_foodcritic_rule(foodcritic_path, ruleID, ruleDesc)

      rule = File.join(foodcritic_path, "lib","Fourth", "#{ruleID.upcase}.rb")

      unless File.exists?(rule)

        puts "** Creating #{ruleID} at #{rule}"

        File.open(rule, 'w') do |file|
          file.write <<-EOH
rule "#{ruleID.upcase}", '#{ruleDesc}' do 
  tags %w{}
  recipe do |ast,filename|
    #Your rule logic here
  end
end
          EOH
        end
      end
    end

    def create_cookbook(foodcritic_path, ruleID)

      cookbook_folder = File.join(foodcritic_path, "cookbooks" )
      puts "** Cookbooks directory: #{cookbook_folder}"
      a = Chef::Knife::CookbookCreate.new
      a.create_cookbook(cookbook_folder, ruleID.downcase, Chef::Config[:cookbook_copyright] , Chef::Config[:cookbook_license])
      a.create_metadata(cookbook_folder, ruleID.downcase, Chef::Config[:cookbook_copyright], Chef::Config[:cookbook_email], Chef::Config[:cookbook_license], "md")
      a.create_readme(cookbook_folder, ruleID.downcase, "md")

      valid_recipe = File.join(foodcritic_path, "cookbooks", ruleID.downcase, "recipes", "valid.rb")

      unless File.exists?(valid_recipe)
        File.open(valid_recipe, 'w') do |file|
          file.write <<-EOH
#
# Cookbook Name:: #{ruleID.downcase}
# Recipe:: valid
#
# Copyright #{Time.now.year}
#
EOH
        end
      end

    end

    def create_specs(foodcritic_path, ruleID)

      spec = File.join(foodcritic_path, "spec","rules", "#{ruleID.upcase}_spec.rb")

      puts "** Creating spec file at #{spec}"

      unless File.exists?(spec)
        File.open(spec, 'w') do |file|
          file.write <<-EOH
require_relative '../spec_helper'

RSpec.describe :#{ruleID.upcase} do
  let(:fc_run) do
  foodcritic_run('#{ruleID.upcase}')
  end
  
  it "generates a warning against the default recipe" do
    expect(warnings(fc_run)).to include('default.rb')
  end

  it "does not generate a warning against a valid recipe" do
    expect(warnings(fc_run)).to_not include('valid.rb')
  end
end
          EOH
        end
      end

    end

  end
end