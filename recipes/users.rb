# A bit shoddy this bit, will make it nicer soon, promise!
# The dependency on bootstrap feels unnecessary
#
node[:bootstrap][:users].each do |username, properties|
  next if properties[:allow] && !properties[:allow].include?(node.hostname)
  next unless properties[:deploy]

  add_to_groups username do
    groups %w(rvm)
  end

  rvm_profile username

  rvmrc_file username
end
