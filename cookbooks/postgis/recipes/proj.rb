bash "install_proj" do
user "root"
  cwd "/tmp"
  code <<-EOH
  wget "http://download.osgeo.org/proj/proj-4.7.0.tar.gz"
  tar xvfz proj-4.7.0.tar.gz
  cd proj-4.7.0
  ./configure
  make
  make install
  EOH
  not_if "test -f /usr/local/bin/proj"
end
