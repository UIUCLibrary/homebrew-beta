cask "speedwagon" do
  version "0.2.0b11"
  sha256 arm: "83eb6a036588ca66511ce4597677ef073b6af52867914b4e90e54d923bc1618c",
         intel: "5d5d5f9081be45974fbb373626b0cdae72b4e9f64dd52ba434b6a3a9810c701b"
  arch arm: "arm64",
       intel: "x86_64"
  url "https://jenkins.library.illinois.edu/nexus/repository/prescon-dist/speedwagon/speedwagon-#{version}-#{arch}.dmg",
      verified: "jenkins.library.illinois.edu/nexus/repository/prescon-dist/speedwagon"
  name "Speedwagon"
  desc "Collection of tools and workflows for DS"
  homepage "https://github.com/UIUCLibrary/Speedwagon"
  conflicts_with formula: "speedwagon"
  app "Speedwagon.app"
end
