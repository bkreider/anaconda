require 'rake'
require 'puppet-lint/tasks/puppet-lint'
require 'rspec/core/rake_task'

PuppetLint.configuration.send("disable_80chars")
PuppetLint.configuration.send("disable_class_parameter_defaults")

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*/*_*spec.rb'
  t.rspec_opts = File.read("spec/spec.opts").chomp || ""
end

task(:default).clear
task :default => :spec

