class Bempp < Formula
  homepage "http://www.bempp.org"
  url "https://github.com/bempp/bempp.git", :using => :git

  version "3.0.3"

  depends_on :python
  depends_on "numpy" => :python
  depends_on "scipy" => :python
  depends_on "cython" => :python

  depends_on "boost"
  depends_on "eigen"
  depends_on "tbb"
  depends_on "pkg-config"

  depends_on "cmake"
  depends_on "bempp/bempp/dune-grid"
  depends_on "bempp/bempp/dune-localfunctions"
  depends_on "bempp/bempp/dune-foamgrid"

  def install

    mkdir "build" do
      args = std_cmake_args
      args.delete "-DCMAKE_CXX_FLAGS_RELEASE="
      args.delete "-DCMAKE_C_FLAGS_RELEASE="
      args << "-DCMAKE_C_FLAGS_RELEASE=-O3 -march=native -DNDEBUG"
      args << "-DCMAKE_CXX_FLAGS_RELEASE=-O3 -march=native -DNDEBUG"
      args << "-DWITH_TESTS=OFF"
      args << ".."

      system "cmake", *args
      system "make","install"
    end
   end
end

    
