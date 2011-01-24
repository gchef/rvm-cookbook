define :rvmrc_file, :user => nil do
  if params[:user]
    path = (params[:user] == "root") ? "/root" : "/home/#{params[:user]}"

    template "#{path}/.rvmrc" do
      source "rvmrc.erb"
      cookbook "rvm"
      owner params[:user]
      group params[:user]
      mode "0644"
      backup false
    end
  end
end
