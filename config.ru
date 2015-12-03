require "sinatra/base"

require "./controllers/application"
require "./controllers/item"
require "./models/item"

map("/") { run ItemController }
