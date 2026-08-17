# typed: false
# frozen_string_literal: true

# ProofX - Evidence Infrastructure for Software
# https://github.com/EslaM-X/proofx

class Proofx < Formula
  desc "Evidence Infrastructure for Software - CLI + GitHub Action + public verification"
  homepage "https://github.com/EslaM-X/proofx"
  version "0.2.1"
  license "MIT"
  head "https://github.com/EslaM-X/proofx.git", branch: "main"

  on_macos do
    on_intel do
      url "https://github.com/EslaM-X/proofx/releases/download/v#{version}/proofx-darwin-amd64"
      sha256 "6901fc738f23b901e4cfc9b3f05b07e1fbef8baa64778146e37de49b2a68a321"
    end
    on_arm do
      url "https://github.com/EslaM-X/proofx/releases/download/v#{version}/proofx-darwin-arm64"
      sha256 "3902153988b3f01b51b7b00d21625de8bdad89cc45413dde614f846109f5950d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/EslaM-X/proofx/releases/download/v#{version}/proofx-linux-amd64"
      sha256 "2ac583e0262ddda96a1d2ea077b83cf0aa60791c9dbc725e439b85d4c54ab866"
    end
    on_arm do
      url "https://github.com/EslaM-X/proofx/releases/download/v#{version}/proofx-linux-arm64"
      sha256 "157bcffd54d753a727c18fd6e80b16a141e33e737ad93a3481a6c04a10352676"
    end
  end

  def install
    bin.install "proofx"
  end

  test do
    assert_match "proofx #{version}", shell_output("#{bin}/proofx --version")
  end
end
