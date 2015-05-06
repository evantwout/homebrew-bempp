class Pytest < Formula
  homepage "http://pytest.org"
  url "https://pypi.python.org/packages/source/p/pytest/pytest-2.7.0.tar.gz"
  sha256 "91dc842785417208d57e5e8dc8bb40f57316c45da24a50c53b49cb8d045519d6"

  depends_on :python if MacOS.version <= :snow_leopard

  resource "py" do
    url "https://pypi.python.org/packages/source/p/py/py-1.4.26.tar.gz"
    sha256 "28dd0b90d29b386afb552efc4e355c889f4639ce93658a7872a2150ece28bb89"
  end

  def install
    %w[py].each do |r|
      resource(r).stage do
        system "python", *Language::Python.setup_install_args(prefix)
      end
    end

    system "python", *Language::Python.setup_install_args(prefix)

  end
end
