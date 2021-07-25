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
    system "#{bin}/gaze", "--version"
  end
end
