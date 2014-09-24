require 'chef/knife'

module Foodcritic
  class FoodcriticRuleDelete < Chef::Knife

    banner "knife foodcritic rule delete"  

    def run

      foodcritic_path = File.expand_path("./foodcritic")
      ruleID = name_args.first

      delete_foodcritic_rule(foodcritic_path, ruleID)
      delete_specs(foodcritic_path, ruleID)
      delete_cookbook(foodcritic_path, ruleID)
      
    end

    def delete_foodcritic_rule(foodcritic_path, ruleID)
      path = File.join(foodcritic_path, "lib","Fourth", "#{ruleID.upcase}.rb")

      if File.exists? path
        puts "** Deleting rule file at #{path}"
        FileUtils.rm path
      end

    end

    def delete_cookbook(foodcritic_path, ruleID)

      path = File.join(foodcritic_path, "cookbooks", ruleID)
      
      if File.exists? path
        puts "** Deleting cookbook at #{path}"
        FileUtils.rm_rf path
      end
      
    end

    def delete_specs(foodcritic_path, ruleID)

      
      path = File.join(foodcritic_path, "spec","rules", "#{ruleID.upcase}_spec.rb")

      if File.exists? path
        puts "** Deleting spec file at #{path}"
        FileUtils.rm path
      end

    end

  end
end