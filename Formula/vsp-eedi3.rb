class VspEedi3 < Formula
  desc "VapourSynth port of EEDI3"
  homepage "https://github.com/HomeOfVapourSynthEvolution/VapourSynth-EEDI3"
  version "r4"
  url "https://github.com/HomeOfVapourSynthEvolution/VapourSynth-EEDI3/archive/r4.tar.gz"
  sha256 "c4d758e0e5a4b0d1b84cd4f78d64a99e992b4e657cf71e3a7be42fdeb1bbf996"
  head "https://github.com/HomeOfVapourSynthEvolution/VapourSynth-EEDI3.git"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "pkg-config" => :build
  depends_on "libtool" => :build
  depends_on "vapoursynth"

  def install
    system "./autogen.sh"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
  def post_install
    ohai ""
    ohai "When you’re done installing plugins:"
    ohai "Please run linkvsp.sh to link the libraries:"
    ohai "`/usr/local/Homebrew/Library/Taps/bl4cc4t/homebrew-vsplugins/linkvsp.sh`"
  end
end
