define :rvmrc_file do
  username = params[:name]

  if username
    path = (username == "root") ? "/root" : "/home/#{username}"

    template "#{path}/.rvmrc" do
      source "rvmrc.erb"
      cookbook "rvm"
      owner username
      group username
      mode "0644"
      backup false
    end
  end
end
