# typed: false
# frozen_string_literal: true

# ProofX — Evidence Infrastructure for Software
# https://github.com/EslaM-X/proofx

class Proofx < Formula
  desc "Evidence Infrastructure for Software — CLI + GitHub Action + public verification"
  homepage "https://github.com/EslaM-X/proofx"
  version "v0.4.0-rc2"
  license "MIT"
  on_macos do
    on_intel do
      url "https://github.com/EslaM-X/proofx/releases/download/v#{version}/proofx-darwin-amd64"
      sha256 "e0d4a1fec5ab00c3080f865d9a739cac0e00b99c11b12b4871a33fce407031a7"
    end
    on_arm do
      url "https://github.com/EslaM-X/proofx/releases/download/v#{version}/proofx-darwin-arm64"
      sha256 "2b0c2587870b90f837c79e320f9e0acb1d3568e592e47081ac61f3d61b0aa6a4"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/EslaM-X/proofx/releases/download/v#{version}/proofx-linux-amd64"
      sha256 "502715cd4dfa591708447a9dc263976629222dbf0dac55872297a65a2ab4ed84"
    end
    on_arm do
      url "https://github.com/EslaM-X/proofx/releases/download/v#{version}/proofx-linux-arm64"
      sha256 "19d577be2a461fb5f710c573412014c6663e715da6f15d133f2a2def57ca10f5"
    end
  end

  def install
    bin.install "proofx"
  end

  test do
    assert_match "proofx #{version}", shell_output("#{bin}/proofx --version")
  end
end
