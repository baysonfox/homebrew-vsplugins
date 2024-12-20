class VspFieldhint < Formula
  desc "Fieldhint plugin for VapourSynth"
  homepage "https://github.com/dubhater/vapoursynth-fieldhint"
  version "3"
  url "https://github.com/dubhater/vapoursynth-fieldhint/archive/v3.tar.gz"
  sha256 "600b3b3391737b7085073d8c49a4497984dad6a9736805ed60414d9c4ed185dc"
  head "https://github.com/dubhater/vapoursynth-fieldhint.git"

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
    ohai "`/opt/homebrew/Library/Taps/baysonfox/homebrew-vsplugins/linkvsp.sh`"
  end
end
