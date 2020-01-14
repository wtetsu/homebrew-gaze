class Gaze < Formula
  desc "Execute commands for you"
  homepage "https://github.com/wtetsu/gaze/"
  url "https://github.com/wtetsu/gaze.git",
      :tag      => "v0.0.4",
      :revision => "1e34431c0a8d7638c3640d16cc429d9fb2ce8a2f"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "dist/gaze", "-v", "cmd/gaze/main.go"
    bin.install "dist/gaze"
  end

  test do
    system "#{bin}/gaze", "--version"
  end
end
