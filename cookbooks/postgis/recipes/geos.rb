bash "install_geos" do
user "root"
  cwd "/tmp"
  code <<-EOH
  wget "http://download.osgeo.org/geos/geos-3.2.2.tar.bz2"
  tar xvfj geos-3.2.2.tar.bz2
  cd geos-3.2.2
  ./configure
  make
  make install
  EOH
  not_if "test -f /usr/local/bin/geod"
end
