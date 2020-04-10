#$:.unshift '.'
require 'config/environment'

#use Rack::Static, :urls => ['/css'], :root => 'public' # Rack fix allows seeing the css folder.
#use Rack::MethodOverride

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use StatusesController
use UsersController
run ApplicationController