define :rvm_profile do
  username = params[:name]

  bash "Add rvm sourcing to #{username} bash profile" do
    code %{
      echo "source '#{node[:rvm_script]}'" >> /home/#{username}/.profile
    }
    only_if "[ $(grep -c rvm /home/#{username}/.profile) -eq 0 ]"
  end
end
