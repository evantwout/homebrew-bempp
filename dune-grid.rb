class DuneGrid < Formula
  homepage "https://www.dune-project.org"
  url "http://www.dune-project.org/download/2.3.1/dune-grid-2.3.1.tar.gz"
  sha256 "f565d3c2562275cba317adef74f75b0a4f6f130abf4e9e1c34712bc9ab63ab03"

  depends_on :fortran
  depends_on "cmake"
  depends_on "bempp/bempp/dune-common"
  depends_on "bempp/bempp/dune-geometry"

  patch :p1 do
    url "http://www.bempp.org/files/dune/dune_grid_cmake.patch"
    sha256 "ff1f02cba57c9524658c1c06d0196af375e5f4689d1e992ad2511e4eb9f17c07"
  end

  def install

    mkdir "build" do
      system "cmake", "-DBUILD_SHARED_LIBS=TRUE","..",*std_cmake_args
      system "make"
      system "make","install"
    end
   end
end

    
