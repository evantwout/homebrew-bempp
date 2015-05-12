class DuneFoamgrid < Formula
  homepage "http://users.dune-project.org/projects/dune-foamgrid"
  url "http://users.dune-project.org/repositories/projects/dune-foamgrid.git", :using => :git, :revision => "0b03d67f4fa0f6cbf8d01e4accf8cdc8e32dae3e"

  version "2.3-dev"

  depends_on "cmake"
  depends_on "bempp/bempp/dune-grid"

  patch :p1 do
    url "https://raw.githubusercontent.com/bempp/homebrew-patches/master/dune_foamgrid_cmake.patch"
    sha256 "06b00b724de19c77b83e2e2f96cdf21e2a90813b4ad626b6f7a22d58b41011dd"
  end

  def install

    mkdir "build" do
      args = std_cmake_args
      args.delete "-DCMAKE_CXX_FLAGS_RELEASE="
      args.delete "-DCMAKE_C_FLAGS_RELEASE="
      args << "-DCMAKE_C_FLAGS_RELEASE=-O3 -march=native"
      args << "-DCMAKE_CXX_FLAGS_RELEASE=-O3 -march=native"
      args << "-DBUILD_SHARED_LIBS=TRUE"
      args << "-DBUILD_TESTING=OFF"
      args << ".."

      system "cmake", *args
      system "make","install"
    end
   end
end
