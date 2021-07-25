class Gaze < Formula
  desc "Execute commands for you"
  homepage "https://github.com/wtetsu/gaze/"
  url "https://github.com/wtetsu/gaze.git",
      tag:      "v1.0.1",
      revision: "999ee1998eff563949e95a6e00df38374dee8d65"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "dist/gaze", "-v", "cmd/gaze/main.go"
    bin.install "dist/gaze"
  end

  test do
    (testpath/"test.txt").write("init")
    o = IO.popen("#{bin}/gaze -c 'cp test.txt out.txt' test.txt")
    thread = Thread.new {
      10.times {|i|
        File.write("test.txt", "hello, world!") rescue nil
        sleep 1
      }
    }
    10.times {
      break if File.exist?("out.txt")
      sleep 1
    }
    thread.terminate
    assert("hello, world!", File.read("out.txt"))
    Process.kill("TERM", o.pid)
  end
end
