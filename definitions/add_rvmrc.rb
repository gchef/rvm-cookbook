define :add_rvmrc do
  path = (params[:name] == "root" ? "/root" : "/home/#{params[:name]}")

  template "#{path}/.rvmrc" do
    source "rvmrc.erb"
    cookbook "rvm"
    owner params[:name]
    group params[:name]
    mode "0644"
    backup false
  end
end
