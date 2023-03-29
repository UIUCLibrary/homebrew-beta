cask "speedwagon" do
  version "0.2.0b13"
  sha256 arm: "616153aa8331e6698b6e35d77f0c479afe2b39394026a5ca8d877933fce13129",
         intel: "3fe7c068f608c824abff12469fdb1d5c2690f5bed4aa16f6a3fbf724d7bc6141"
  arch arm: "arm64",
       intel: "x86_64"
  url "https://jenkins.library.illinois.edu/nexus/repository/prescon-dist/speedwagon/#{version}/speedwagon-#{version}-#{arch}.dmg",
      verified: "jenkins.library.illinois.edu/nexus/repository/prescon-dist/speedwagon"
  name "Speedwagon"
  desc "Collection of tools and workflows for DS"
  homepage "https://github.com/UIUCLibrary/Speedwagon"
  conflicts_with formula: "speedwagon"
  app "Speedwagon.app"
end
