class Verdict < Formula
  desc "Gate CI on load-test regressions (k6, JMeter)"
  homepage "https://github.com/beyzaelbeyoglu/verdict-releases"
  url "https://github.com/beyzaelbeyoglu/verdict-releases/releases/download/v0.1.0/verdict-0.1.0.jar"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  depends_on "openjdk@21"

  def install
    libexec.install "verdict-#{version}.jar" => "verdict.jar"
    bin.write_jar_script libexec/"verdict.jar", "verdict", java_version: "21"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/verdict --version")
  end
end
