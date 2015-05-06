class Cython < Formula
  homepage "http://www.cython.org"
  url "https://pypi.python.org/packages/source/C/Cython/cython-0.22.tar.gz"
  sha256 "14307e7a69af9a0d0e0024d446af7e51cc0e3e4d0dfb10d36ba837e5e5844015"

  depends_on :python if MacOS.version <= :snow_leopard

  def install
    system "python", *Language::Python.setup_install_args(prefix)

  end
end
