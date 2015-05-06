class Bempp < Formula
  homepage "http://www.bempp.org"
  head "https://github.com/bempp/bempp.git", :branch => "development"

  depends_on :python
  depends_on "numpy" => :python
  depends_on "scipy" => :python

  depends_on "boost"
  depends_on "eigen"
  depends_on "tbb"
  depends_on "pkg-config"

  depends_on "cmake"
  depends_on "bempp/bempp/dune-grid"
  depends_on "bempp/bempp/dune-localfunctions"
  depends_on "bempp/bempp/dune-alugrid"
  depends_on "bempp/bempp/pytest"
  depends_on "bempp/bempp/mako"
  depends_on "bempp/bempp/cython"
  



  def install

    mkdir "build" do
      system "cmake", "..",*std_cmake_args
      system "make"
      system "make","install"
    end
   end
end

    
