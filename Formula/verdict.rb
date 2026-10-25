class Verdict < Formula
  desc "Gate CI on load-test regressions (k6, JMeter)"
  homepage "https://github.com/beyzaelbeyoglu/verdict-releases"
  url "https://github.com/beyzaelbeyoglu/verdict-releases/releases/download/v0.2.1/verdict-0.2.1.jar"
  sha256 "020c75f3c07cb73ea83e4da23ee44c3bef489a54b9a296d353304bdb42222a3f"
  depends_on "openjdk@21"

  def install
    libexec.install "verdict-#{version}.jar" => "verdict.jar"
    bin.write_jar_script libexec/"verdict.jar", "verdict", java_version: "21"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/verdict --version")
  end
end
