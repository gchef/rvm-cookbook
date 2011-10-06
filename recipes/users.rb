node[:rvm_users].each do |username|
  add_to_groups username do
    groups %w(rvm)
  end

  rvm_profile username

  rvmrc_file username
end

bash "Updating RVM wrapper scripts" do
  code %{
    cd /root && source .profile && rvm update --head && rvm reload && rvm repair all
  }
end
