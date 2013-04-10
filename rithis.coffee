symfio  = require "symfio"


container = symfio "rithis.com", __dirname
container.set "components", [
  "angular#~1.0",
  "angular-resource#~1.0",
  "angular-cookies#~1.0",
  "normalize-css#~2.1",
  "modernizr#~2.6",
  "jquery#~1.9",
  "jquery-ui#~1.9"
]

loader = container.get "loader"
loader.use symfio.plugins.express
loader.use symfio.plugins.expressLogger
loader.use symfio.plugins.assets
loader.use symfio.plugins.bower
loader.use symfio.plugins.crud

loader.use (container, callback) ->
  unloader = container.get "unloader"
  crud = container.get "crud"
  app = container.get "app"

  callback()


loader.load() if require.main is module
module.exports = container