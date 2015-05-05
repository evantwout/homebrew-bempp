class DuneGeometry < Formula
  homepage "https://www.dune-project.org"
  url "http://www.dune-project.org/download/2.3.1/dune-geometry-2.3.1.tar.gz"
  sha256 "caf8f55b79e3217c3e845a9ada48b51a57f090cbbd4e6994e72067f3449b565c"

  depends_on :fortran
  depends_on "cmake"
  depends_on "bempp/bempp/dune-common"

  patch :p2 do
    url "http://www.bempp.org/files/dune/dune_geometry_cmake.patch"
    sha256 "9e20fcd20ef963a649d997a473fafc158904d634403e31bb5b9f192f9bf0e21e"
  end

  def install

    mkdir "build" do
      system "cmake", "-DBUILD_SHARED_LIBS=TRUE","..",*std_cmake_args
      system "make"
      system "make","install"
    end
   end
end

    
