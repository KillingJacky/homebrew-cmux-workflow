# cmux-workflow.rb.tmpl — Homebrew formula template
#
# This template is rendered by scripts/render-homebrew-formula.sh
# The rendered formula should be placed in a homebrew tap repository.
#
# Usage after rendering:
#   brew install <your-tap>/cmux-workflow

class CmuxWorkflow < Formula
  desc "Coordinate multiple AI coding agents inside cmux terminal multiplexer"
  homepage "https://github.com/KillingJacky/cmux-workflow"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/KillingJacky/cmux-workflow/releases/download/v0.1.0/cmux-workflow-v0.1.0-darwin-arm64.tar.gz"
      sha256 "f7b2cbb0ef0173dc1afc0868d147d8eddc84de830922317bf06cd8a269161316"
    end
    on_intel do
      url "https://github.com/KillingJacky/cmux-workflow/releases/download/v0.1.0/cmux-workflow-v0.1.0-darwin-amd64.tar.gz"
      sha256 "885cf617db864e15b2396b57ad3ec8d31138a43b185fc79e38ff3bbf79498978"
    end
  end

  def install
    bin.install "cmux-workflow"
  end

  test do
    assert_match "cmux-workflow version", shell_output("#{bin}/cmux-workflow version")
  end

  def caveats
    <<~EOS
      After installation, run the following to set up global templates:
        cmux-workflow install-global

      To configure asset downloads from your own GitHub repo, edit:
        ~/.cmux-workflow/config.json

      Set asset_source.github_repo to your repository (e.g., "your-org/cmux-workflow-fork").
    EOS
  end
end
