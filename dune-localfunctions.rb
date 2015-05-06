class DuneLocalfunctions < Formula
  homepage "https://www.dune-project.org"
  url "http://www.dune-project.org/download/2.3.1/dune-localfunctions-2.3.1.tar.gz"
  sha256 "92c2380f58c7c5f6ff6eb0f4ac694626c3bc81686cbef4534bfb44e351f0b771"

  depends_on "cmake"
  depends_on "bempp/bempp/dune-common"
  depends_on "bempp/bempp/dune-geometry"

  patch :p0 do
    url "http://www.bempp.org/files/dune/dune_localfunctions.patch"
    sha256 "f58401065724cf014406a41f8ab88eea89f07903b10c107e179e6fd28a5ff087"
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
