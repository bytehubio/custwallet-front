workers 1
threads 2, 2

app_name = "custwallet.app"
app_dir = "/home/devton/sites/#{app_name}"

shared_dir = "#{app_dir}/shared"
pids_folder = "#{shared_dir}/puma"
log_folder = "#{pids_folder}/log"
rails_env = ENV['RAILS_ENV'] || "production"
begin
  `mkdir #{shared_dir}`
  `mkdir #{pids_folder}`
  `mkdir #{log_folder}`
rescue => ex
  p "#{ex.message}"
end

pidfile "#{pids_folder}/puma.pid"
state_path "#{pids_folder}/puma.state"
plugin :tmp_restart

bind "unix://#{pids_folder}/puma.sock"
environment rails_env

# NO DATABASE YET
# on_worker_boot do
#   require "active_record"
#   ActiveRecord::Base.connection.disconnect! rescue ActiveRecord::ConnectionNotEstablished
#   ActiveRecord::Base.establish_connection(YAML.load_file("#{app_dir}/config/database.yml")[rails_env])
# end

if rails_env == 'production'
  stdout_redirect "#{log_folder}/puma.stdout.log", "#{log_folder}/puma.stderr.log", true
  daemonize false
  preload_app!
end

if ENV['RAILS_LOG_TO_STDOUT']
  stdout_redirect false
  daemonize false
end