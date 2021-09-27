# What it does

It provides a handler that will attempt to reconnect the Active Record with the database.

Whenever the database is reset while the hutch process is alive, the connection is not re-established like in a Rails 
application, so add this a handler to your hutch configuration.

Messages that get the error will still be nacked by hutch, you will need to add code to your application to requeue 
your messsages if you want.

# Configuring

On your hutch initializer

```ruby
require 'hutch/acknowledgements/retry_once'

Hutch::Config.set(:error_handlers, [
  Hutch::ErrorHandlers::Logger.new, Hutch::ErrorHandlers::ReconnectActiveRecord.new
])
```

or if you just want to add the handler after some other configurations

```ruby
require 'hutch/acknowledgements/retry_once'

Hutch::Config[:error_handlers] << Hutch::ErrorHandlers::ReconnectActiveRecord.new
```

