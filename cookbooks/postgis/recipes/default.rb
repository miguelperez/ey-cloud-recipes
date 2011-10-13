if ['solo', 'db_master'].include?(node[:instance_role])
  require_recipe "postgis::geos"
  require_recipe "postgis::proj"
  require_recipe "postgis::postgis"
  require_recipe "postgis::template"
end
