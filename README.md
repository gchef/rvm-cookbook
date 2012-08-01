This chef cookbook installs RVM system-wide, shared across all users.

### Usage

To use this cookbook, set the following attributes on the node via a role or the node object itself. In a role.rb:

```ruby
"rvm" => {
  "rubies"  => ["ree", "1.9.2"]
  }
}
```
