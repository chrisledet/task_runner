# task_runner

Execute code in parallel

## Installation

```
$ gem install task_runner
```

or place the following line in Gemfile

```ruby
gem ‘task_runner’
```

## Examples

Here’s a quick example on how to use task_runner library.

We will output the word “foo” to the console 3 times

```ruby
require ‘task_runner’

# we have a simple task that prints “foo” to the console
class Foo
  def say
    print ‘foo!’
  end
end

# we want run 3 foo tasks
tasks = [Foo.new, Foo.new, Foo.new]

# create a runner and provide a common set of objects
runner = TaskRunner.new(tasks)

# call :say on each element in parallel and waits for all of them to finish
runner.run(:say)
```

If you run the example in Interactive Ruby you should see "foofoofoofoofoo”

## Configuration

Change the global default configuration for all TaskRunners

```ruby
TaskRunner.config do |t|
  # cancel any task that takes over a given amount of time (60 seconds by default)
  t.task_timeout = 60.seconds

  # cancel all tasks once the global timer is reach (nil by default)
  t.global_timeout = 30.seconds

  # start each task 5 seconds apart, 0 seconds by default
  t.delay = 5.seconds
end
```

You can change the configuration for a TaskRunner by passing the initializer a block

```ruby
runner = TaskRunner.new(tasks) do |t|
  t.task_timeout = 60.seconds
  t.delay = 10.seconds
end
```
