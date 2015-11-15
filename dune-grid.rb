class DuneGrid < Formula
  homepage "https://www.dune-project.org"
  url "http://www.dune-project.org/download/2.3.1/dune-grid-2.3.1.tar.gz"
  sha256 "f565d3c2562275cba317adef74f75b0a4f6f130abf4e9e1c34712bc9ab63ab03"

  depends_on "cmake"
  depends_on "bempp/bempp/dune-common"
  depends_on "bempp/bempp/dune-geometry"

  patch :p2 do
    url "https://raw.githubusercontent.com/bempp/homebrew-patches/master/dune_grid_cmake.patch"
    sha256 "ff1f02cba57c9524658c1c06d0196af375e5f4689d1e992ad2511e4eb9f17c07"
  end

  def install

    mkdir "build" do
      args = std_cmake_args
      args.delete "-DCMAKE_CXX_FLAGS_RELEASE="
      args.delete "-DCMAKE_C_FLAGS_RELEASE="
      args << "-DCMAKE_C_FLAGS_RELEASE=-O3 -march=native"
      args << "-DCMAKE_CXX_FLAGS_RELEASE=-O3 -march=native"
      args << "-DBUILD_SHARED_LIBS=TRUE"
      args << ".."

      system "cmake", *args
      system "make","install"
    end
   end
end
