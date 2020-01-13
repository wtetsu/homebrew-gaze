class Gaze < Formula
  desc "Execute commands for you"
  homepage "https://github.com/wtetsu/gaze/"
  url "https://github.com/wtetsu/gaze.git",
      :tag      => "v0.0.3",
      :revision => "4f34b9291b434dc86b75a39c222796a517b08329"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "dist/gaze", "-v", "cmd/gaze/main.go"
    bin.install "dist/gaze"
  end

  test do
    system "#{bin}/gaze", "--version"
  end
end
