bash "restart_database" do
  user "deploy"
  code <<-EOH
    sudo /etc/init.d/postgresql-8.3 restart
  EOH
end
