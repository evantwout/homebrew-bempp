class DuneLocalfunctions < Formula
  homepage "https://www.dune-project.org"
  url "http://www.dune-project.org/download/2.3.1/dune-localfunctions-2.3.1.tar.gz"
  sha256 "92c2380f58c7c5f6ff6eb0f4ac694626c3bc81686cbef4534bfb44e351f0b771"

  depends_on :fortran
  depends_on "cmake"
  depends_on "bempp/bempp/dune-common"
  depends_on "bempp/bempp/dune-geometry"

  def install

    mkdir "build" do
      system "cmake", "-DBUILD_SHARED_LIBS=TRUE","..",*std_cmake_args
      system "make"
      system "make","install"
    end
   end
end

    
