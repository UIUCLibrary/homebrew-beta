cask "speedwagon" do
  version "0.2.0b9"
  sha256 arm: "7c3d8560574f6e40e44c3c8a191aa2c95fdd13fbc0ba74bfb1575bff0295c3da", intel: "942b3f31ac071b889bbd89337b8af1ca09a51b1256da614e8a70d4903722ce54"
  arch arm: "arm64", intel: "x86_64"
  url "https://jenkins.library.illinois.edu/nexus/repository/prescon-dist/speedwagon/speedwagon-#{version}-#{arch}.dmg",
      verified: "jenkins.library.illinois.edu/nexus/repository/prescon-dist/speedwagon"
  name "Speedwagon"
  desc "Collection of tools and workflows for DS"
  homepage "https://github.com/UIUCLibrary/Speedwagon"
  conflicts_with formula: "speedwagon"
  app "Speedwagon.app"
end
