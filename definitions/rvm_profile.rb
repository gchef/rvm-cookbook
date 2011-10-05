define :rvm_profile do
  username = params[:name]
  user_home = (username == "root") ? "/root" : "/home/#{username}"

  bash "Add rvm sourcing to #{username} bash profile" do
    code %{
      echo "source '#{node[:rvm_script]}'" >> #{user_home}/.profile
    }
    only_if "[ $(grep -c rvm #{user_home}/.profile) -eq 0 ]"
  end
end
