require "benchmark"
require "rspec"
require "task_runner"

describe TaskRunner do
  subject { TaskRunner.new(@tasks) }

  describe "example from README" do
    before do
      @tasks = [Foo.new, Foo.new, Foo.new]
    end

    it "will print call say on each object" do
      @tasks.each do |task|
        expect(task).to receive(:say)
      end

      subject.run(:say)
    end
  end

  describe "it executes in parallel" do
    before do
      @tasks = [Timer.new, Timer.new, Timer.new]
    end

    it "will print call say on each object" do
      total_time = Benchmark.realtime do
        subject.run(:wait)
      end

      expect(total_time).to be < 3 # seconds
    end
  end
end

class Foo
  def say
    print "foo!"
  end
end

class Timer
  def wait
    sleep 1
  end
end
