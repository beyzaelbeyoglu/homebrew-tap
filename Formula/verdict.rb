class Verdict < Formula
  desc "Gate CI on load-test regressions (k6, JMeter)"
  homepage "https://github.com/beyzaelbeyoglu/verdict-releases"
  url "https://github.com/beyzaelbeyoglu/verdict-releases/releases/download/v0.3.0/verdict-0.3.0.jar"
  sha256 "de80a1db6c729f2be2aee68936a0487e589b495a9067b69cd247f6c38179874d"
  depends_on "openjdk@21"

  def install
    libexec.install "verdict-#{version}.jar" => "verdict.jar"
    bin.write_jar_script libexec/"verdict.jar", "verdict", java_version: "21"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/verdict --version")
  end
end
