define :install_rvm do
  bash "Installing rvm" do
    code "bash < <(curl -s https://rvm.beginrescueend.com/install/rvm) && source ~/.bashrc"
    not_if "[ -d /usr/local/rvm ]"
  end
end
