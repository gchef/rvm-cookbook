define :install_rvm do
  bash "install_rvm" do
    code <<-EOH
    bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
    EOH
    not_if { File.exists? "/usr/local/rvm" }
  end
end
