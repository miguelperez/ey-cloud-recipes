#
# Cookbook Name:: postgis
# Recipe:: default
#
# package "libgeos-dev" do
#   action :install
#   provider Chef::Provider::Package::Portage
# end
# 
# package "libproj-dev" do
#   action :install
#   provider Chef::Provider::Package::Portage
# end

# script "install GEOS" do
#   interpreter "bash"
#   user "root"
#   cwd "/tmp"
#   code <<-EOH
#   wget http://download.osgeo.org/geos/geos-3.2.2.tar.bz2
#   tar -xvjf geos-3.2.2.tar.bz2
#   cd geos-3.2.2
#   ./configure
#   make
#   make install
#   EOH
#   not_if "ls -la | grep geos-3.2.2"
# end
# 
# script "install Proj4" do
#   interpreter "bash"
#   user "root"
#   cwd "/tmp"
#   code <<-EOH
#   wget http://download.osgeo.org/proj/proj-4.7.0.tar.gz
#   tar -xvzf PROJ.4.7.0.tar.gz
#   cd PROJ.4
#   ./configure
#   sh install
#   EOH
#   not_if "ls -la | grep PROJ.4"
# end

# execute "download postgis" do
#   command "cd /tmp && wget http://www.postgis.org/download/postgis-1.5.2.tar.gz"
#   action :run
#   not_if "ls -la | grep postgis-1.5.2"
# end
# 
# script "install Postgis" do
#   interpreter "bash"
#   user "root"
#   cwd "/tmp"
#   code <<-EOH
#   tar -xvzf postgis-1.5.2.tar.gz
#   cd postgis-1.5.2
#   ./configure
#   make
#   make install
#   EOH
# end

#configure the environment so we can use the gentoo postgis-1.5.2 ebuild
#based on http://linuxreviews.org/gentoo/ebuilds/
#execute "download ebuild" do
#  command "wget "
#  /engineyard/portage/engineyard/dev-db/postgis
#end

enable_package "dev-db/postgis" do
  version "1.5.2"
end

package "dev-db/postgis" do
  version "1.5.2"
  action :install
end


# script "create Postgis template" do
#   interpreter "bash"
#   user "root"
#   code <<-EOH  
#   # Set postgis-1.5 path.
#   POSTGIS_SQL_PATH=`pg_config --sharedir`/contrib/postgis-1.5
#   
#   # Creating the template spatial database
#   createdb -E UTF8 -T template0 template_postgis
#   # and add PLPGSQL language support.
#   createlang -d template_postgis plpgsql
#   
#   # Loading the PostGIS SQL routines.
#   psql -d template_postgis -f $POSTGIS_SQL_PATH/postgis.sql
#   psql -d template_postgis -f $POSTGIS_SQL_PATH/spatial_ref_sys.sql
#   
#   # Enabling users to alter spatial tables.
#   psql -d template_postgis -c "GRANT ALL ON geometry_columns TO PUBLIC;"
#   psql -d template_postgis -c "GRANT ALL ON geography_columns TO PUBLIC;"
#   psql -d template_postgis -c "GRANT ALL ON spatial_ref_sys TO PUBLIC;"
#   
#   # Garbage-collect and freeze.
#   psql -d template_postgis -c "VACUUM FULL;"
#   psql -d template_postgis -c "VACUUM FREEZE;"
#   
#   # Allows non-superusers the ability to create from this template.
#   psql -d postgres -c "UPDATE pg_database SET datistemplate='true' WHERE datname='template_postgis';"
#   psql -d postgres -c "UPDATE pg_database SET datallowconn='false' WHERE datname='template_postgis';"
#   
#   EOH
# end

# 
# ey_cloud_report "postgis" do
#   message "creating postgis template"
# end
