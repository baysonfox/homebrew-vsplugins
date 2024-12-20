class VspWwxd < Formula
  desc "Xvid-like scene change detection for VapourSynth"
  homepage "https://github.com/dubhater/vapoursynth-wwxd"
  head "https://github.com/dubhater/vapoursynth-wwxd.git"

  depends_on "pkg-config" => :build
  depends_on "libtool" => :build
  depends_on "vapoursynth"

  def install
    inreplace "src/wwxd.c", "malloc(sizeof(d));", "static_cast<WwxdData*>(malloc(sizeof(d)));"
    system "g++ -o libwwxd.dylib -fPIC -shared -dynamiclib -O2 -Wall -Wextra -Wno-unused-parameter $(pkg-config --cflags vapoursynth) src/wwxd.c src/detection.c"
    lib.install Dir["*.dylib"]
  end
  def post_install
    ohai ""
    ohai "When you’re done installing plugins:"
    ohai "Please run linkvsp.sh to link the libraries:"
    ohai "`/opt/homebrew/Library/Taps/baysonfox/homebrew-vsplugins/linkvsp.sh`"
  end
end
