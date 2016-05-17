Gem::Specification.new do |spec|
  spec.name                   = "librato-alerts"
  spec.version                = "1.1.0"
  spec.date                   = "2016-05-17"
  spec.summary                = "Interacts with Librato's Alerts API."
  spec.description            = "Interacts with Librato's Alerts API."
  spec.authors                = ["Juan Guerrero"]
  spec.email                  = ["juan@chicisimo.com"]
  spec.files                  = Dir["lib/**/*.rb"]
  spec.homepage               = "http://github.com/juanxo/librato-alerts"
  spec.extra_rdoc_files       = ["README.md"]
  spec.required_ruby_version  = ">= 2.1.0"
  spec.licenses               = ["MIT"]

  spec.add_runtime_dependency     "nestful"
end
