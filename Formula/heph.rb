class Heph < Formula
  desc "Local document harness with grounded retrieval"
  homepage "https://github.com/gildrb/heph-agent"
  url "https://github.com/gildrb/heph-agent/archive/refs/tags/v0.0.63.tar.gz"
  sha256 "dda58bed442af391d4018db2d975ec6d845773493fc331744396813f1270e93a"
  license "MIT"

  depends_on "python@3.13"
  depends_on "uv"

  def install
    system "uv", "venv", libexec, "--python", formula_opt_bin("python@3.13") / "python3.13"
    system "uv", "pip", "install", "--python", libexec / "bin/python", "./packages/heph"
    (bin / "heph").write_env_script libexec / "bin/heph", PATH: "#{libexec}/bin:$PATH"
  end

  test do
    assert_match "heph", shell_output("#{bin}/heph --version")
  end
end
