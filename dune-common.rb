class DuneCommon < Formula
  homepage "https://www.dune-project.org"
  url "http://www.dune-project.org/download/2.3.1/dune-common-2.3.1.tar.gz"
  sha256 "040cd3811d195631cfa99fab43443d69c1b83f82737b0cd98e4f330ec84051f5"

  depends_on :fortran
  depends_on "cmake"

  patch :p1 do
    url "http://www.bempp.org/files/dune/dune_common_cmake.patch"
    sha256 "44d048d3c1e2da5f6820da963d01f66897b802c6a3a48b34182cfa3251e78d67"
  end

  def install

    mkdir "build" do
      system "cmake", "..",*std_cmake_args
      system "make"
      system "make","install"
    end
   end
end

    
