set :stage, :production
set :rails_env, 'production'

server '13.126.234.81', user: 'ubuntu', roles: %w{app db web}

set :branch, :master
set :rvm_ruby_version, '3.3.4' # Ensure this matches your installed Ruby version

# Specify SSH options
set :ssh_options, {
  keys: ['king-gaming.pem'],
  forward_agent: true,  # Set to true if using a .pem file
  auth_methods: %w(publickey)
}
