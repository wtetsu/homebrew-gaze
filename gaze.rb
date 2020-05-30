class Gaze < Formula
  desc "Execute commands for you"
  homepage "https://github.com/wtetsu/gaze/"
  url "https://github.com/wtetsu/gaze.git",
      :tag      => "v0.1.5",
      :revision => "37d59c43105953d970adf5c9a4874e822065ec99"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "dist/gaze", "-v", "cmd/gaze/main.go"
    bin.install "dist/gaze"
  end

  test do
    system "#{bin}/gaze", "--version"
  end
end
