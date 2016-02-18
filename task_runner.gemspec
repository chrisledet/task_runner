require File.join(__dir__, "lib", "task_runner")

Gem::Specification.new do |s|
  s.name        = "task_runner"
  s.version     = TaskRunner::VERSION
  s.date        = "2016-02-18"
  s.summary     = "Execute code in parallel"
  s.description = "Invoke a method on a collection of objects in parallel"
  s.authors     = ["Chris Ledet"]
  s.email       = "me@chrisledet.com"
  s.files       = ["lib/task_runner.rb", "README.md", "LICENSE"]
  s.homepage    = "https://github.com/chrisledet/task_runner"
  s.license     = "MIT"

  s.add_development_dependency "rspec", "~> 3.4", ">= 3.4.0"
end
