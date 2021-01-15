# typed: true
# frozen_string_literal: true

# Forumula for building Speedwagon for distribution via Homebrew
class Speedwagon < Formula # rubocop:disable Metrics/ClassLength
  include Language::Python::Virtualenv
  desc "Collection of tools and workflows for DS"
  homepage "https://github.com/UIUCLibrary/Speedwagon"
  url "https://github.com/UIUCLibrary/Speedwagon/archive/v0.1.5b8.tar.gz"
  sha256 "ca0af868b1bceace862474f5d2a31b5ecc0a7d2cfd3498462afdba04dd00c513"
  head "https://github.com/UIUCLibrary/Speedwagon.git"

  bottle do
    root_url "https://jenkins.library.illinois.edu/nexus/repository/homebrew-bottles-beta/beta/"
    cellar :any
    sha256 "826355a05bdf569403ab13f978d5468daa3acd747e45ed64902ee6f7c3ceeab0" => :catalina
  end

  depends_on "cmake" => :build
  depends_on "conan" => :build
  depends_on "python@3.8"
  depends_on "qt"
  depends_on "sip"
  depends_on "tesseract"

  resource "uiucprescon.images" do
    url "https://github.com/UIUCLibrary/uiucprescon.images/archive/v0.0.4b1.tar.gz"
    sha256 "7de3b381e2f932e446a35647f9ae3d9e7c6ffc3f934d4e2b9c91d6b0f19e89ad"
  end

  resource "uiucprescon.packager" do
    url "https://github.com/UIUCLibrary/Packager/archive/v0.2.11b5.tar.gz"
    sha256 "a434f9a6e8b7e2c947e2270186a79c0d5d796357ede4c035a2bf53e0a6b5a10c"
  end

  resource "uiucprescon.ocr" do
    url "https://github.com/UIUCLibrary/Tesseract_Glue/archive/v0.1.1.tar.gz"
    sha256 "97417dd1a523676fe14624a8c1b51df1b1790553abc854ec4e8a5a6447e1341d"
  end

  resource "HathiValidate" do
    url "https://github.com/UIUCLibrary/HathiValidate/archive/v0.3.6b5.tar.gz"
    sha256 "89c1141c08758a785525f7a2a7dccca58a8e3197f6094e0490fe9c8b2603da5e"
  end

  resource "pyhathiprep" do
    url "https://github.com/UIUCLibrary/pyhathiprep/archive/v0.1.5b4.tar.gz"
    sha256 "6a2d2caec46b646da0524c301d401f7f19fc859d4f5a30cb76c87928b70b2d19"
  end

  resource "HathiZip" do
    url "https://github.com/UIUCLibrary/HathiZip/archive/v0.1.9.tar.gz"
    sha256 "40753f5325f9b31fca2a7fb51fa6626db0ca29fa43a1183b4b333fbec7d798c7"
  end

  resource "uiucprescon-getmarc" do
    url "https://github.com/UIUCLibrary/pygetmarc/archive/0.1.3b1.tar.gz"
    sha256 "2753be8fd85105e42638ce55eff1090ea472f0e0813cfa4a2fe86447fde9e72e"
  end

  resource "py3exiv2bind" do
    url "https://github.com/UIUCLibrary/pyexiv2bind/archive/v0.1.5.tar.gz"
    sha256 "1c9f5e10c91b993a7cf96939b007a1073838e9a17efd40b168e10e6f93912fa1"
  end

  resource "uiucprescon.imagevalidate" do
    url "https://github.com/UIUCLibrary/imagevalidate/archive/v0.1.5.tar.gz"
    sha256 "ff3e65fa517521067b7052131572617aafff7a0ff7cf9f50103e9a49c393be11"
  end

  # ==================================================
  # Third party
  # ==================================================
  #
  resource "six" do
    url "https://files.pythonhosted.org/packages/6b/34/415834bfdafca3c5f451532e8a8d9ba89a21c9743a0c59fbd0205c7f9426/six-1.15.0.tar.gz"
    sha256 "30639c035cdb23534cd4aa2dd52c3bf48f06e5f4a941509c8bafd8ce11080259"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/6b/47/c14abc08432ab22dc18b9892252efaf005ab44066de871e72a38d6af464b/requests-2.25.1.tar.gz"
    sha256 "27973dd4a904a4f13b263a19c866c13b92a39ed1c964655f025f3f8d3d75b804"
  end

  resource "distro" do
    url "https://files.pythonhosted.org/packages/a6/a4/75064c334d8ae433445a20816b788700db1651f21bdb0af33db2aab142fe/distro-1.5.0.tar.gz"
    sha256 "0e58756ae38fbd8fc3020d54badb8eae17c5b9dcbed388b17bb55b8a5928df92"
  end

  resource "pyparsing" do
    url "https://files.pythonhosted.org/packages/c1/47/dfc9c342c9842bbe0036c7f763d2d6686bcf5eb1808ba3e170afdb282210/pyparsing-2.4.7.tar.gz"
    sha256 "c203ec8783bf771a155b207279b9bccb8dea02d8f0c9e5f8ead507bc3246ecc1"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/55/fd/fc1aca9cf51ed2f2c11748fa797370027babd82f87829c7a8e6dbe720145/packaging-20.4.tar.gz"
    sha256 "4357f74f47b9c12db93624a82154e9b120fa8293699949152b22065d556079f8"
  end

  resource "scikit-build" do
    url "https://files.pythonhosted.org/packages/71/02/1e94506b7bee5739317f2d141cebab7dab5bb5731b377e718fddd3b3e7e7/scikit-build-0.11.1.tar.gz"
    sha256 "da40dfd69b2456fad1349a894b90180b43712152b8a85d2a00f4ae2ce8ac9a5c"
  end

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

  resource "wheel" do
    url "https://files.pythonhosted.org/packages/ed/46/e298a50dde405e1c202e316fa6a3015ff9288423661d7ea5e8f22f589071/wheel-0.36.2.tar.gz"
    sha256 "e11eefd162658ea59a60a0f6c7d493a7190ea4b9a85e335b33489d9f17e0245e"
  end

  #===========
  resource "certifi" do
    url "https://files.pythonhosted.org/packages/06/a9/cd1fd8ee13f73a4d4f491ee219deeeae20afefa914dfb4c130cfc9dc397a/certifi-2020.12.5.tar.gz"
    sha256 "1a4995114262bffbc2413b159f2a1a480c969de6e6eb13ee966d470af86af59c"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/29/e6/d1a1d78c439cad688757b70f26c50a53332167c364edb0134cadd280e234/urllib3-1.26.2.tar.gz"
    sha256 "19188f96923873c92ccb987120ec4acaa12f0461fa9ce5d3d0772bc965a39e08"
  end

  def install
    venv = virtualenv_create(libexec, "python3")
    python_deps.each do |r|
      venv.pip_install resource(r)
    end

    install_special

    venv.pip_install_and_link buildpath

    system "#{libexec}/bin/pip", "check"
  end

  test do
    system "#{libexec}/bin/pip", "check"
    system "#{bin}/speedwagon", "--version"
  end

  private

  def install_special
    resource("uiucprescon.packager").stage do
      system "#{libexec}/bin/pip", "install", "-v", "--no-deps", "--no-binary", ":all:",
             "--ignore-installed", "#{Pathname.pwd}[kdu]"
    end

    system "#{libexec}/bin/pip", "install", "-v", "--no-deps", "--no-binary", ":all:",
           "--ignore-installed", "pykdu-compress==0.1.3", "-i",
           "https://devpi.library.illinois.edu/production/release/+simple/"
  end

  def python_deps # rubocop:disable Metrics/MethodLength
    %w[
      PyQt5
      PyQt5_sip
      distro
      six
      pyparsing
      packaging
      certifi
      urllib3
      requests
      wheel
      scikit-build
      uiucprescon.ocr
      ruamel.yaml
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
      HathiValidate
      HathiZip
      py3exiv2bind
      pyhathiprep
      uiucprescon.images
      uiucprescon-getmarc
      uiucprescon.imagevalidate
    ]
  end
end
