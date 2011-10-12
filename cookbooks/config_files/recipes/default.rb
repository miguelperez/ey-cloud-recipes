#
# Cookbook Name:: config_files
# Recipe:: default
#
app_name = "rfspotcube"
if ['app_master', 'app', 'solo'].include?(node[:instance_role]) then
  template "/data/#{app_name}/shared/config/omniauth.yml" do
    owner node[:owner_name]
    group node[:owner_name]
    mode 0644
    source "omniauth.yml.erb"
    variables({
      :facebook => {:token => "167590113286949", :secret => "d744ae91dbb13bde96224d145ffa7bf8"},
      :twitter => {:token => "qt0dxH2jEWr6bH8WLSZBQ", :secret => "QRTz6z7O7NUx3ZCKoAztYMigv7KtUrC3188cWiDkc"},
    })
  end
end