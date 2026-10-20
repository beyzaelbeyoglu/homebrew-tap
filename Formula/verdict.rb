class Verdict < Formula
  desc "Gate CI on load-test regressions (k6, JMeter)"
  homepage "https://github.com/beyzaelbeyoglu/verdict-releases"
  url "https://github.com/beyzaelbeyoglu/verdict-releases/releases/download/v0.2.0/verdict-0.2.0.jar"
  sha256 "73ff5d2dc386df09cb68be3a6af993ee37ba7bd98c149a2d75a392a8e385c0ea"
  depends_on "openjdk@21"

  def install
    libexec.install "verdict-#{version}.jar" => "verdict.jar"
    bin.write_jar_script libexec/"verdict.jar", "verdict", java_version: "21"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/verdict --version")
  end
end
