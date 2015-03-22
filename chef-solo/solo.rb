cookbook_path ['/rust-server-cookbook/', '/Users/portaj/.berkshelf/cookbooks/']

file_cache_path '/var/chef/cache'
file_backup_path '/var/chef/backup'

log_level :info
verbose_logging true

# Verify all HTTPS connections (recommended)
ssl_verify_mode :verify_peer
