define :add_rvmrc do
  template "/home/#{params[:name]}/.rvmrc" do
    source "rvmrc.erb"
    cookbook "rvm"
    owner params[:name]
    group params[:name]
    mode "0644"
  end
end