require "bundler/gem_tasks"
 
require 'rake/testtask'
 
Rake::TestTask.new do |t|
  t.libs << 'lib/flika'
  t.test_files = FileList['test/lib/flika/*_test.rb']
  t.verbose = true
end
 
task :default => :test
