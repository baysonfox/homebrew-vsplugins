class VspKnlmeanscl < Formula
  desc "An optimized OpenCL implementation of the Non-local means de-noising algorithm"
  homepage "https://github.com/Khanattila/KNLMeansCL"
  # version "1.1.1"
  # url "https://github.com/Khanattila/KNLMeansCL/archive/v1.1.1.tar.gz"
  # sha256 "9e0df80c64cc48a522f37e3f6e4edafe8eba22c0f78bcc8f54fbfbe9e30aa479"
  head "https://github.com/Khanattila/KNLMeansCL.git"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build
  depends_on "boost" => :build
  depends_on "vapoursynth"
  depends_on "zimg"

  def install
    # fixed in fbb60ec:
#     inreplace "meson.build" do |s|
#       s.gsub! "install_dir : join_paths(get_option('prefix'), get_option('libdir'), 'vapoursynth')", "install_dir : '#{lib}'"
#       s.gsub! "meson.get_compiler('cpp').find_library('OpenCL')", "dependency('OpenCL')
# boost = dependency('boost', modules : ['filesystem', 'system'])"
#       s.gsub! "[vapoursynth, opencl]", "[vapoursynth, opencl, boost]"
#     end
#     inreplace "KNLMeansCL/shared/ocl_utils.h", "#include <CL/opencl.h>", "#include <OpenCL/opencl.h>"
#     inreplace "KNLMeansCL/NLMVapoursynth.cpp" do |s|
#       s.gsub! "if (snprintf(options", "snprintf(options"
#       s.gsub! ")
# #else", "#else"
#     end
    system "meson", "--prefix", "#{prefix}", "build"
    system "ninja", "-C", "build"
    system "ninja", "-C", "build", "install"
    # works with 1.1.1:
    # inreplace "./configure" do |s|
    #   s.gsub! ",-read_only_relocs,suppress -Wl", ""
    #   s.gsub! "strip", "strip -x"
    # end
    # system "./configure", "--install=#{lib}"
    # system "make", "install"
  end
  # def post_install
  #   ohai ""
  #   ohai "When you’re done installing plugins:"
  #   ohai "Please run linkvsp.sh to link the libraries:"
  #   ohai "`/opt/homebrew/Library/Taps/baysonfox/homebrew-vsplugins/linkvsp.sh`"
  # end
end
