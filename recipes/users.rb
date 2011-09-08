# A bit shoddy this bit, will make it nicer soon, promise!
# The dependency on bootstrap feels unnecessary
#
node[:bootstrap][:users].each do |username, properties|
  next if properties[:allow] && !properties[:allow].include?(node.hostname)
  next unless properties[:deploy]
  bash "Adding #{username} to rvm group" do
    code "usermod -a -G rvm #{username}"
    only_if "[ $(id #{username} 2>&1 | grep -c uid) -gt 0 ]"
  end

  bash "Add rvm sourcing to #{username} bash profile" do
    code %{
      echo "source '#{node[:rvm_script]}'" >> /home/#{username}/.profile
    }
    only_if "[ $(grep -c rvm /home/#{username}/.profile) -eq 0 ]"
  end

  add_rvmrc_file_to username
end
