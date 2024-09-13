max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

#port        ENV.fetch("PORT") { 3000 }
bind "unix:///var/www/Todoapp/tmp/sockets/puma.sock"

# ディレクトリが存在しない場合は、作成する
on_worker_boot do
    Dir.mkdir("/var/www/Todoapp/tmp/sockets") unless File.exist?("/var/www/Todoapp/tmp/sockets")
end

environment ENV.fetch("RAILS_ENV") { "development" }

pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

plugin :tmp_restart