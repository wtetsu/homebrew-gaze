class Gaze < Formula
  desc "Execute commands for you"
  homepage "https://github.com/wtetsu/gaze/"
  url "https://github.com/wtetsu/gaze.git",
      :tag      => "v0.1.4",
      :revision => "f7f6a7b12d6fc7e6dfd1e0b26d3fdda571f476e1"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "dist/gaze", "-v", "cmd/gaze/main.go"
    bin.install "dist/gaze"
  end

  test do
    system "#{bin}/gaze", "--version"
  end
end
