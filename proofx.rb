# typed: false
# frozen_string_literal: true

# ProofX — Evidence Infrastructure for Software
# https://github.com/EslaM-X/proofx

class Proofx < Formula
  desc "Evidence Infrastructure for Software — CLI + GitHub Action + public verification"
  homepage "https://github.com/EslaM-X/proofx"
  version "v0.3.0"
  license "MIT"
  on_macos do
    on_intel do
      url "https://github.com/EslaM-X/proofx/releases/download/v#{version}/proofx-darwin-amd64"
      sha256 "eff7ef9802145a8d991e511fcb3c8a2d4e6339cdffc21bedf7c136fce5eb8899"
    end
    on_arm do
      url "https://github.com/EslaM-X/proofx/releases/download/v#{version}/proofx-darwin-arm64"
      sha256 "09d03c3661ea4fbc43eccc618ae87e4ff29d4da31edcec70110b673fdd8b3d27"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/EslaM-X/proofx/releases/download/v#{version}/proofx-linux-amd64"
      sha256 "62be2208597c89866b9c4ea3653ffd2f480a03ec5250ea441655804f09a02d8b"
    end
    on_arm do
      url "https://github.com/EslaM-X/proofx/releases/download/v#{version}/proofx-linux-arm64"
      sha256 "59ef649255b695743339761a7da0c05e221b6c4ad387a87bd3752ef1a474c1fd"
    end
  end

  def install
    bin.install "proofx"
  end

  test do
    assert_match "proofx #{version}", shell_output("#{bin}/proofx --version")
  end
end
