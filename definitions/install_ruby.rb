define :install_ruby do
  ruby = params[:name]

  bash "install_#{ruby.gsub(/\W/, '_').downcase}" do
    code <<-EOH
    rvm install #{ruby}
    rvm --create #{ruby}@global exec gem install bundler
    EOH
    not_if { `rvm list`.include? ruby }
  end
end

