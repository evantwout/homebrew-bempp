class DuneFoamgrid < Formula
  homepage "http://users.dune-project.org/projects/dune-foamgrid"
  url "http://users.dune-project.org/repositories/projects/dune-alugrid.git", :using => :git, :revision => "7dead4425ed3b9c6d53f9a4004f449ed1172840f"

  version "2.3-dev"

  depends_on "cmake"
  depends_on "bempp/bempp/dune-grid"

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
