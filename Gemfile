source :rubygems

prawn_version = "0.10.2"

group :develop do
  gem "prawn", :git => "git://github.com/sandal/prawn", :tag => prawn_version, :submodules => true
end

group :test do
  gem "prawn", :git => "git://github.com/sandal/prawn", :tag => prawn_version, :submodules => true
  gem "pdf-inspector", "~>1.0.0", :require => "pdf/inspector", :git => "https://github.com/sandal/pdf-inspector.git"
  gem "test-spec"
  gem "mocha"
  gem "test-unit", "1.2.3", :platform => :ruby_19
end
