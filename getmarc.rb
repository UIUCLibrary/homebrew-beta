# frozen_string_literal: true

# Homebrew release formula for getmarc
class Getmarc < Formula
  include Language::Python::Virtualenv
  desc "Gets Marc xml data"
  homepage "https://github.com/UIUCLibrary/uiucprescon.getmarc2"
  url "https://github.com/UIUCLibrary/uiucprescon.getmarc2/archive/v0.1.0b2.tar.gz"
  version "0.1.0b2"
  sha256 "9f924006570a2747febbc6d258d4af0b5f40a2cc895c888e8e4d00203af91e7f"
  head "https://github.com/UIUCLibrary/uiucprescon.getmarc2.git"
  bottle do
    root_url "https://jenkins.library.illinois.edu/nexus/repository/homebrew-bottles-beta/beta/"
    cellar :any
    sha256 "d868830a9ed6369eb61d333b6f3e736531b2dd98a6d021043ad33a4ca33429f5" => :catalina
    sha256 "99d8ef7c4987dea6eb4c38999a6f84dd0f0d90a4c372ee3dcb438537a8296a8b" => :mojave
  end

  depends_on "cython" => :build
  depends_on "libxml2"
  depends_on "libxslt"
  depends_on "python@3.8"

  resource "lxml" do
    url "https://files.pythonhosted.org/packages/03/a8/73d795778143be51d8b86750b371b3efcd7139987f71618ad9f4b8b65543/lxml-4.5.1.tar.gz"
    sha256 "27ee0faf8077c7c1a589573b1450743011117f1aa1a91d5ae776bbc5ca6070f2"
  end

  resource "chardet" do
    url "https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz"
    sha256 "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/da/67/672b422d9daf07365259958912ba533a0ecab839d4084c487a5fe9a5405f/requests-2.24.0.tar.gz"
    sha256 "b3559a131db72c33ee969480840fff4bb6dd111de7dd27c8ee1f820f4f00231b"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/ad/13/eb56951b6f7950cadb579ca166e448ba77f9d24efc03edd7e55fa57d04b7/idna-2.8.tar.gz"
    sha256 "c357b3f628cf53ae2c4c05627ecc484553142ca23264e593d327bcde5e9c3407"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/40/a7/ded59fa294b85ca206082306bba75469a38ea1c7d44ea7e1d64f5443d67a/certifi-2020.6.20.tar.gz"
    sha256 "5930595817496dd21bb8dc35dad090f1c2cd0adfaf21204bf6732ca5d8ee34d3"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/81/f4/87467aeb3afc4a6056e1fe86626d259ab97e1213b1dfec14c7cb5f538bf0/urllib3-1.25.10.tar.gz"
    sha256 "91056c15fa70756691db97756772bb1eb9678fa585d9184f24534b100dc60f4a"
  end

  def install
    virtualenv_install_with_resources
    system "#{libexec}/bin/pip", "check"
  end
end
