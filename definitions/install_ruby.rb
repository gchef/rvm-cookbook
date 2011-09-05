define :install_ruby do
  ruby = params[:name]

  bash "RVM installing Ruby #{ruby}" do
    code %{
      rvm install #{ruby}
      rvm --create #{ruby}@global exec gem install bundler
    }
    only_if "[ $(rvm list | grep -c #{ruby}) -eq 0 ]"
  end
end

