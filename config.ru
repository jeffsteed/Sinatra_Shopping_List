require "sinatra/base"

require "./controllers/application"
require "./controllers/account"
require "./controllers/item"
require "./models/item"
require "./models/account"

map("/items") { run ItemController }
map("/") { run AccountController }
