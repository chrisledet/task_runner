require "thread"

class TaskRunner
  VERSION = "0.0.1".freeze

  def initialize(tasks)
    @tasks = tasks
    @task_statuses = [true] * tasks.size
    @mutex = Mutex.new
  end

  def run(m)
    @tasks.each_with_index do |t, i|
      Thread.new do
        t.public_send(m)

        @mutex.synchronize do
          @task_statuses[i] = nil
        end
      end
    end

    loop do
      break if finished?
    end
  end

  def finished?
    @task_statuses.compact.empty?
  end
end
