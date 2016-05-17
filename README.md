# LibratoAlerts

A small library that allows retrieving, enabling and disabling librato alerts.

## Usage

```ruby
require "librato-alerts"

LibratoAlerts.configure do |config|
  config.user = "librato email"
  config.token = "librato token" # https://metrics.librato.com/tokens
end

LibratoAlerts.all
# => [{ :id => 1, :name => "alert.name", :description => nil, :conditions => [], :services => [], :attributes => {}, :active => true,
#  :created_at => 646099200, :updated_at => 646099200, :version => 2, :rearm_seconds => 600, :rearm_per_signal => false }, ...]

LibratoAlerts.disable(1) # => nil

LibratoAlerts.enable(1) # => nil

LibratoAlerts.delete(1) # => nil
```
