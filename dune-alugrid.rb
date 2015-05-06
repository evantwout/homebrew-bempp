class DuneAlugrid < Formula
  homepage "http://users.dune-project.org/projects/dune-alugrid"
  url "http://www.bempp.org/files/dune/alugrid-2.3.1.tar.gz"
  sha256 "3ed1894839a4e35d4c633533d1ad11b92f4ecc33a15068d9efa9ae6188394510"

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
