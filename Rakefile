require "rubygems"
require "bundler"
Bundler.setup

require "rake"
require "rake/testtask"

task :default => [:test]

desc "Run all tests, test-spec, mocha, and pdf-reader required"
Rake::TestTask.new do |test|
  # test.ruby_opts  << "-w"  # .should == true triggers a lot of warnings
  test.libs       << "spec"
  test.test_files =  Dir[ "spec/*_spec.rb" ]
  test.verbose    =  true
end

desc "run all examples"
task :examples do
  mkdir_p "output"
  examples = Dir["examples/**/*.rb"]
  t = Time.now
  puts "Running Examples"
  examples.each { |file| `ruby -Ilib #{file}` }
  puts "Ran in #{Time.now - t} s"
  `mv *.pdf output`
end
