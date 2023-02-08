cask "speedwagon" do
  version "0.2.0b10"
  sha256 arm: "5b16cb6434dac166bd420e9c82f781073924ed249bdf27f2fd0c4656b9fdac07",
         intel: "7d8b2c3c183a302d7109d7355fb5ddd067d91af31439212673069a92d5e9695c"
  arch arm: "arm64",
       intel: "x86_64"
  url "https://jenkins.library.illinois.edu/nexus/repository/prescon-dist/speedwagon/speedwagon-#{version}-#{arch}.dmg",
      verified: "jenkins.library.illinois.edu/nexus/repository/prescon-dist/speedwagon"
  name "Speedwagon"
  desc "Collection of tools and workflows for DS"
  homepage "https://github.com/UIUCLibrary/Speedwagon"
  conflicts_with formula: "speedwagon",
                 cask: "speedwagon"
  app "Speedwagon.app"
end
