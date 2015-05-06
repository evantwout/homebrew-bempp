class Mako < Formula
  homepage "http://www.makotemplates.org/"
  url "https://pypi.python.org/packages/source/M/Mako/Mako-1.0.1.tar.gz"
  sha256 "45f0869febea59dab7efd256fb451c377cbb7947bef386ff0bb44627c31a8d1c"

  depends_on :python if MacOS.version <= :snow_leopard

  resource "MarkupSafe" do
    url "https://pypi.python.org/packages/source/M/MarkupSafe/MarkupSafe-0.23.tar.gz"
    sha256 "a4ec1aff59b95a14b45eb2e23761a0179e98319da5a7eb76b56ea8cdc7b871c3"
  end

  def install
    %w[MarkupSafe].each do |r|
      resource(r).stage do
        system "python", *Language::Python.setup_install_args(prefix)
      end
    end

    system "python", *Language::Python.setup_install_args(prefix)

  end
end
