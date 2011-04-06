source :rubygems

prawn_version = "0.11.1"

group :develop do
  gem "prawn", ">=#{prawn_version}"
end

group :test do
  gem "prawn", ">=#{prawn_version}"
  gem "pdf-inspector", "~>1.0.0", :require => "pdf/inspector", :git => "https://github.com/sandal/pdf-inspector.git"
  gem "test-spec"
  gem "mocha"
  gem "test-unit", "1.2.3", :platform => :ruby_19
end
