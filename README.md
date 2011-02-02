RVM System Wide Cookbook
========================

This cookbook installs RVM system wide.

Usage
-----

To use this cookbook, set the following attributes on the node via a role or the node object itself. In a role.rb:

    "rvm" => {
      "rubies"  => ["ree", "1.9.2"]
      }
    }

When creating a user in a recipe, you may use the following helper:

    add_rvmrc_file_to "username"
