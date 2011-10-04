node[:rvm_users].each do |username|
  add_to_groups username do
    groups %w(rvm)
  end

  rvm_profile username

  rvmrc_file username
end
