class VspVfrtocfr < Formula
  desc "Vapoursynth port of VFRToCFR"
  homepage "https://github.com/Irrational-Encoding-Wizardry/Vapoursynth-VFRToCFR"
  # version "r2"
  # url "https://github.com/Irrational-Encoding-Wizardry/Vapoursynth-VFRToCFR/archive/v1.0.tar.gz"
  # sha256 "d0bfc415c9bcca0711a19f72f249280de53c93440e1a61bf907d6ebe5a7bfe85"
  head "https://github.com/Irrational-Encoding-Wizardry/Vapoursynth-VFRToCFR.git"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build
  depends_on "vapoursynth"

  # fixed in d00a374:
  # patch do
  #   url "https://raw.githubusercontent.com/baysonfox/homebrew-vsplugins/master/patches/vsp-vfrtocfr.diff"
  #   sha256 "21880d2c08ba3fdae7097315c2e20e5aea1c9539fc6eb347a8a7e6e0003a3a41"
  # end

  def install
    # system "meson", "configure", "-Dcpp_std=c++11"
    (buildpath/"build").mkpath
    Dir.chdir("#{buildpath}/build")
    system "meson", "--prefix", "#{prefix}",
                    "--buildtype", "release", ".."
    system "ninja"
    system "ninja", "install"
  end
  def post_install
    ohai ""
    ohai "When you’re done installing plugins:"
    ohai "Please run linkvsp.sh to link the libraries:"
    ohai "`/opt/homebrew/Library/Taps/baysonfox/homebrew-vsplugins/linkvsp.sh`"
  end
end
