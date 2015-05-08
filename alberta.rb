class Alberta < Formula
  homepage "http://www.alberta-fem.de"
  url "http://www.mathematik.uni-stuttgart.de/fak8/ians/lehrstuhl/nmh/downloads/alberta/alberta-3.0.1.tar.gz"
  sha256 "cbb00a50ee10ae832557cfdd180d99d66733814f800ed7cb06fbe3e494f7abca"

  depends_on "cmake"
  depends_on "pkg-config"

  def install
    
    args = ["--prefix=#{prefix}", "--disable-fem-toolbox"]

    system "./configure", *args
    system "make"
    system "make", "install"

  end
end
