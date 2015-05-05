class DuneAlugrid < Formula
  homepage "http://users.dune-project.org/projects/dune-alugrid"
  url "http://www.bempp.org/files/dune/alugrid-2.3.1.tar.gz"
  sha256 "3ed1894839a4e35d4c633533d1ad11b92f4ecc33a15068d9efa9ae6188394510"

  depends_on :fortran
  depends_on "cmake"
  depends_on "bempp/bempp/dune-grid"

  def install

    mkdir "build" do
      system "cmake", "-DBUILD_SHARED_LIBS=TRUE","..",*std_cmake_args
      system "make"
      system "make","install"
    end
   end
end

    
