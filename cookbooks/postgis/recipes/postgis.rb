bash "install_postgis" do
user "root"
  cwd "/tmp"
  code <<-EOH
  wget "http://postgis.refractions.net/download/postgis-1.5.2.tar.gz"
  tar xvfz postgis-1.5.2.tar.gz
  cd postgis-1.5.2
  ./configure
  make
  make install
  ldconfig
  EOH
  not_if "test -f /usr/share/postgresql-8.3/contrib/postgis-1.5/postgis.sql"
end
