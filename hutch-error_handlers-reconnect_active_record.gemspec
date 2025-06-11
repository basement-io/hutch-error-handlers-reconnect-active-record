Gem::Specification.new do |s|
  s.name        = 'hutch-error_handlers-reconnect_active_record'
  s.version     = '0.0.1'
  s.summary     = 'Try to reconnect the active record connection in case of errors'
  s.description = 'Add this to your hutch config to try to reconnect whenever there is an error with ActiveRecord'
  s.authors     = ['Hélio Nagamachi']
  s.email       = '69481759+helionagamachi-basement@users.noreply.github.com'
  s.files       = ['lib/hutch/error_handlers/reconnect_active_record.rb']
  s.homepage    = 'https://github.com/basement-io/hutch-error-handlers-reconnect-active-record'
  s.license       = 'MIT'

  s.add_runtime_dependency 'hutch', '~> 1.1'
  s.add_runtime_dependency 'activerecord', '>= 6.1'
end
