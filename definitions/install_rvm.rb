define :install_rvm do
  bash "install_rvm" do
    code <<-EOH
    bash < <( curl -L http://bit.ly/rvm-install-system-wide )
    EOH
    not_if { File.exists? "/usr/local/rvm" }
  end

  profile = "/etc/profile"
  line = "[[ -s '/usr/local/lib/rvm' ]] && source '/usr/local/lib/rvm'"

  unless File.read(profile).include? line
    File.open(profile, "a") { |f| f.puts line }
  end
end
