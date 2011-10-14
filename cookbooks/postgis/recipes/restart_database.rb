bash "restart_database" do
  user "deploy"
  code <<-EOH
    emerge postgresql-server --config
    
    sudo /etc/init.d/postgresql-8.3 restart
  EOH
end
