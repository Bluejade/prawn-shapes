source 'https://rubygems.org'

prawn_version = "1.1.0"

group :develop, :test do
  gem "prawn", ">=#{prawn_version}"
end

group :test do
  gem "pdf-inspector", "~>1.0.0", :require => "pdf/inspector", :git => "https://github.com/sandal/pdf-inspector.git"
  gem "rspec"
  gem "mocha"
  gem "pry"
end
