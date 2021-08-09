class Gaze < Formula
  desc "Execute commands for you"
  homepage "https://github.com/wtetsu/gaze"
  url "https://github.com/wtetsu/gaze/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "c5fe124f950604d9ad054d29bed925edbe40ea477d495524c95631b7440711aa"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "dist/gaze", "-v", "cmd/gaze/main.go"
    bin.install "dist/gaze"
  end

  test do
    (testpath/"test.txt").write("init")
    o = IO.popen("#{bin}/gaze -c 'cp test.txt out.txt' test.txt")
    thread = Thread.new do
      10.times do
        begin
          File.write("test.txt", "hello, world!")
        rescue
          # Safe to ignore
        end
        sleep 1
      end
    end
    10.times do
      break if File.exist?("out.txt")

      sleep 1
    end
    thread.terminate
    assert("hello, world!", File.read("out.txt"))
    Process.kill("TERM", o.pid)
  end
end
