class DuneFoamgrid < Formula
  homepage "http://users.dune-project.org/projects/dune-foamgrid"
  url "http://users.dune-project.org/repositories/projects/dune-foamgrid.git", :using => :git, :revision => "7dead4425ed3b9c6d53f9a4004f449ed1172840f"

  version "2.3-dev"

  depends_on "cmake"
  depends_on "bempp/bempp/dune-grid"

  patch :p1 do
    url "https://raw.githubusercontent.com/bempp/homebrew-patches/master/dune_foamgrid_cmake.patch"
    sha256 "40f52ad35dfe7c11a9882293f200be5de7fe3cabdc860fa239bfef6ee33719df"
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
