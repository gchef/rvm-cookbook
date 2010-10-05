define :install_rvm_ruby do
  bash "Installing #{params[:name]} & bundler via RVM" do
    code <<-EOH
    rvm install #{params[:name]}
    rvm --create #{params[:name]}@global exec gem install bundler
    EOH
    not_if { `rvm list`.include? params[:name] }
  end
end
