class Speedwagon < Formula
  include Language::Python::Virtualenv
  url "https://jenkins.library.illinois.edu/job/OpenSourceProjects/job/Speedwagon/job/dev/12/artifact/dist/speedwagon-0.1.5.dev0.zip"
  sha256 "0395a506f1a1b33792f91bfb8826ebd7bfa7ccc847aa3b5023cd25b677516437"
  homepage "https://github.com/UIUCLibrary/Speedwagon"
  desc "Collection of tools and workflows for DS"
  head "https://github.com/UIUCLibrary/Speedwagon.git"

  resource "uiucprescon.images" do
    url "https://github.com/UIUCLibrary/uiucprescon.images/archive/v0.0.4b1.tar.gz"
    sha256 "7de3b381e2f932e446a35647f9ae3d9e7c6ffc3f934d4e2b9c91d6b0f19e89ad"
  end

  resource "uiucprescon.packager" do
    url "https://github.com/UIUCLibrary/Packager/archive/v0.2.11b2.tar.gz"
    sha256 "ba4c9ffc7b2b5cd899334eb18562fec8fa635ffc1358fa4a95c22c9a934ff9ef"
  end

  resource "uiucprescon.ocr" do
    url "https://github.com/UIUCLibrary/Tesseract_Glue/archive/v0.1.1b2.tar.gz"
    sha256 "e7b1eb20fe9b907a3dda0cd904b2a272a6324e583e9822c61d65c0b5c96e1bff"
  end
  resource "HathiValidate" do
    url "https://github.com/UIUCLibrary/HathiValidate/archive/v0.3.6b1.tar.gz"
    sha256 "c919c6622cc56d8a66f853c47173dc7b221caba6e9d3d5da3c14cd7f73d1399a"
  end
  resource "pyhathiprep" do
    url "https://github.com/UIUCLibrary/pyhathiprep/archive/0.1.3.tar.gz"
    sha256 "c7bb9aa8b6f20d7322b110280e0620fa62f325c390f508bd11af0387e8bbf924"
  end
  resource "HathiZip" do
    url "https://github.com/UIUCLibrary/HathiZip/archive/v0.1.6b1.tar.gz"
    sha256 "9fcf36dfe9f7151e8902fbd15dcf1f2825e5c9ca1426335acb8489b5bac9fbc3"
  end

  resource "uiucprescon-getmarc" do
    url "https://github.com/UIUCLibrary/pygetmarc/archive/0.1.3b1.tar.gz"
    sha256 "2753be8fd85105e42638ce55eff1090ea472f0e0813cfa4a2fe86447fde9e72e"
  end
  resource "hathichecksumupdater" do
    url "https://github.com/UIUCLibrary/HT_checksum_update/archive/0.1.2b2.tar.gz"
    sha256 "66696d159861e3ecfcaefac406590ef14e130d92285f318cc4e9b1d45a301d0b"
  end
  resource "py3exiv2bind" do
    url "https://github.com/UIUCLibrary/pyexiv2bind/archive/0.1.5b3.tar.gz"
    sha256 "68d16d7bca61b0af54fd8d160073f65cf18ab2697c9487f54a96c6b627f6aebd"
  end
  resource "uiucprescon.imagevalidate" do
    url "https://github.com/UIUCLibrary/imagevalidate/archive/0.1.5b1.tar.gz"
    sha256 "1e398940fb780b37b187ffcd59dde6e5ef2981f28d0a6ef0b4b744da8184b3a5"
  end
  # ==================================================
  # Third party
  # ==================================================
  #
  resource "ruamel.yaml" do
    url "https://files.pythonhosted.org/packages/16/8b/54a26c1031595e5edd0e616028b922d78d8ffba8bc775f0a4faeada846cc/ruamel.yaml-0.16.10.tar.gz"
    sha256 "099c644a778bf72ffa00524f78dd0b6476bca94a1da344130f4bf3381ce5b954"
  end

  resource "ruamel.yaml.clib" do
    url "https://files.pythonhosted.org/packages/92/28/612085de3fae9f82d62d80255d9f4cf05b1b341db1e180adcf28c1bf748d/ruamel.yaml.clib-0.2.0.tar.gz"
    sha256 "b66832ea8077d9b3f6e311c4a53d06273db5dc2db6e8a908550f3c14d67e718c"
  end
  resource "tzlocal" do
    url "https://files.pythonhosted.org/packages/ce/73/99e4cc30db6b21cba6c3b3b80cffc472cc5a0feaf79c290f01f1ac460710/tzlocal-2.1.tar.gz"
    sha256 "643c97c5294aedc737780a49d9df30889321cbe1204eac2c2ec6134035a92e44"
  end
  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/64/c2/b80047c7ac2478f9501676c988a5411ed5572f35d1beff9cae07d321512c/PyYAML-5.3.1.tar.gz"
    sha256 "b8eac752c5e14d3eca0e6dd9199cd627518cb5ec06add0de9d32baeee6fe645d"
  end
  resource "pytz" do
    url "https://files.pythonhosted.org/packages/f4/f6/94fee50f4d54f58637d4b9987a1b862aeb6cd969e73623e02c5c00755577/pytz-2020.1.tar.gz"
    sha256 "c35965d010ce31b23eeb663ed3cc8c906275d6be1a34393a1d73a41febf4a048"
  end
  resource "yarl" do
    url "https://files.pythonhosted.org/packages/d6/67/6e2507586eb1cfa6d55540845b0cd05b4b77c414f6bca8b00b45483b976e/yarl-1.4.2.tar.gz"
    sha256 "58cd9c469eced558cd81aa3f484b2924e8897049e06889e8ff2510435b7ef74b"
  end

  resource "pluggy" do
    url "https://files.pythonhosted.org/packages/75/21/cdabca0144cfa282c2893dc8e07957245ac8657896ef3ea26f18b6fda710/pluggy-0.12.0.tar.gz"
    sha256 "0825a152ac059776623854c1543d65a4ad408eb3d33ee114dff91e57ec6ae6fc"
  end

  resource "multidict" do
    url "https://files.pythonhosted.org/packages/7f/8f/b3c8c5b062309e854ce5b726fc101195fbaa881d306ffa5c2ba19efa3af2/multidict-4.5.2.tar.gz"
    sha256 "024b8129695a952ebd93373e45b5d341dbb87c17ce49637b34000093f243dd4f"
  end
  resource "importlib-resources" do
    url "https://files.pythonhosted.org/packages/83/a4/ce09af12e1a91b5b77cefc893ef5054619553734c5b42f143d93ed581744/importlib_resources-1.0.2.tar.gz"
    sha256 "d3279fd0f6f847cced9f7acc19bd3e5df54d34f93a2e7bb5f238f81545787078"
  end
  resource "zipp" do
    url "https://files.pythonhosted.org/packages/ce/8c/2c5f7dc1b418f659d36c04dec9446612fc7b45c8095cc7369dd772513055/zipp-3.1.0.tar.gz"
    sha256 "c599e4d75c98f6798c509911d08a22e6c021d074469042177c8c86fb92eefd96"
  end
  resource "importlib-metadata" do
    url "https://files.pythonhosted.org/packages/fd/5c/9caf9fe3d92afc3c0296c97b0fd72cacfcaf20e8b2c42306840914e052fa/importlib_metadata-0.18.tar.gz"
    sha256 "cb6ee23b46173539939964df59d3d72c3e0c1b5d54b84f1d8a7e912fe43612db"
  end
  resource "idna-ssl" do
    url "https://files.pythonhosted.org/packages/46/03/07c4894aae38b0de52b52586b24bf189bb83e4ddabfe2e2c8f2419eec6f4/idna-ssl-1.1.0.tar.gz"
    sha256 "a933e3bb13da54383f9e8f35dc4f9cb9eb9b3b78c6b36f311254d6d0d92c6c7c"
  end
  resource "idna" do
    url "https://files.pythonhosted.org/packages/ad/13/eb56951b6f7950cadb579ca166e448ba77f9d24efc03edd7e55fa57d04b7/idna-2.8.tar.gz"
    sha256 "c357b3f628cf53ae2c4c05627ecc484553142ca23264e593d327bcde5e9c3407"
  end
  resource "chardet" do
    url "https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz"
    sha256 "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae"
  end
  resource "attrs" do
    url "https://files.pythonhosted.org/packages/cc/d9/931a24cc5394f19383fbbe3e1147a0291276afa43a0dc3ed0d6cd9fda813/attrs-19.1.0.tar.gz"
    sha256 "f0b870f674851ecbfbbbd364d6b5cbdff9dcedbc7f3f5e18a6891057f21fe399"
  end
  resource "async-timeout" do
    url "https://files.pythonhosted.org/packages/a1/78/aae1545aba6e87e23ecab8d212b58bb70e72164b67eb090b81bb17ad38e3/async-timeout-3.0.1.tar.gz"
    sha256 "0c3c816a028d47f659d6ff5c745cb2acf1f966da1fe5c19c77a70282b25f4c5f"
  end
  resource "aiohttp" do
    url "https://files.pythonhosted.org/packages/0f/58/c8b83f999da3b13e66249ea32f325be923791c0c10aee6cf16002a3effc1/aiohttp-3.5.4.tar.gz"
    sha256 "9c4c83f4fa1938377da32bc2d59379025ceeee8e24b89f72fcbccd8ca22dc9bf"
  end
  resource "lxml" do
    url "https://files.pythonhosted.org/packages/03/a8/73d795778143be51d8b86750b371b3efcd7139987f71618ad9f4b8b65543/lxml-4.5.1.tar.gz"
    sha256 "27ee0faf8077c7c1a589573b1450743011117f1aa1a91d5ae776bbc5ca6070f2"
  end

  resource "PyQt5" do
    url "https://files.pythonhosted.org/packages/8c/90/82c62bbbadcca98e8c6fa84f1a638de1ed1c89e85368241e9cc43fcbc320/PyQt5-5.15.0.tar.gz"
    sha256 "c6f75488ffd5365a65893bc64ea82a6957db126fbfe33654bcd43ae1c30c52f9"
  end

  resource "PyQt5_sip" do
    url "https://files.pythonhosted.org/packages/73/a0/0987d3c153b18fd5f7b190bdc71e8edd05ff65e9084efd1f4985c2b1dc0f/PyQt5_sip-12.8.0.tar.gz"
    sha256 "0a34b6596bdd28d52da3a51fa8d9bb0b287bcb605c2512aa3251b9028cc71f4d"
  end

  depends_on "cmake"
  depends_on "conan"
  depends_on "python"
  depends_on "qt"
  depends_on "tesseract"

  def install
    venv = virtualenv_create(libexec, "python3")
    %w[ruamel.yaml
       ruamel.yaml.clib
       tzlocal
       pyyaml
       pytz
       yarl
       pluggy
       multidict
       importlib-resources
       zipp
       importlib-metadata
       idna-ssl
       idna
       chardet
       attrs
       async-timeout
       aiohttp
       lxml
       PyQt5
       PyQt5_sip
       hathichecksumupdater
       HathiValidate
       HathiZip
       py3exiv2bind
       pyhathiprep
       uiucprescon.images
       uiucprescon-getmarc
       uiucprescon.imagevalidate
       uiucprescon.ocr].each do |r|
      venv.pip_install resource(r)
    end

    resource("uiucprescon.packager").stage do
      system "#{libexec}/bin/pip", "install", "-v", "--no-deps", "--no-binary", ":all:",
             "--ignore-installed", "#{Pathname.pwd}[kdu]"
    end

    system "#{libexec}/bin/pip", "install", "-v", "--no-deps", "--no-binary", ":all:",
           "--ignore-installed", "pykdu-compress==0.1.3b1", "-i",
           "https://devpi.library.illinois.edu/production/release/+simple/"

    venv.pip_install_and_link buildpath

    system "#{libexec}/bin/pip", "check"
  end

  test do
    system "#{libexec}/bin/pip", "check"
    system "#{bin}/speedwagon", "--version"
  end

  bottle do
    root_url "https://homebrew.bintray.com/bottles-beta"
    cellar :any
    rebuild 1
    sha256 "9f8ace355fe3752edf8a651259fb7a5e24d5427af52b7fa0e8804a200292b39b" => :catalina
  end
end
