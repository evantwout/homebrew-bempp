class DuneAlugrid < Formula
  homepage "http://users.dune-project.org/projects/dune-alugrid"
  url "http://users.dune-project.org/repositories/projects/dune-alugrid.git", :using => :git, :revision => "95c07ef8c80c2ea6f19c441eedf997507e40cde4"

  version "2.3-dev"

  depends_on "cmake"
  depends_on "bempp/bempp/dune-grid"

  patch :p1 do
    url "https://github.com/bempp/homebrew-patches/raw/master/alugrid_cmake.patch"
    sha256 "7710e8ab5855b164c1e2b9b650ebdb1ff8d810e2a4dd3e219ee44d7ef97075dd"
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
