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
    sha256 "5d5b23f2a1ebb8ae253ec7b42896738cb1187c529e7c4d1c8e9b800a0e859f37" => :mojave
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
    url "https://api.github.com/repos/UIUCLibrary/HathiValidate/tarball/v0.3.6b5"
    sha256 "c7fcf0107740d0a3565ddc0a1e099e9a287d28f805bc0bfb53d92ecf7fa96398"
  end

  resource "pyhathiprep" do
    url "https://api.github.com/repos/UIUCLibrary/pyhathiprep/tarball/v0.1.5b4"
    sha256 "48e16f1eb71ad97c9229295f42026819894badac2ffe54eb0ce20565e799fa50"
  end

  resource "HathiZip" do
    url "https://api.github.com/repos/UIUCLibrary/HathiZip/tarball/v0.1.9"
    sha256 "90ad912ba78b035c33a582a6b0288fc82b37aecf39fedac69a4f6ad8403d013f"
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

  resource "PyQt5" do
    url "https://files.pythonhosted.org/packages/28/6c/640e3f5c734c296a7193079a86842a789edb7988dca39eab44579088a1d1/PyQt5-5.15.2.tar.gz"
    sha256 "372b08dc9321d1201e4690182697c5e7ffb2e0770e6b4a45519025134b12e4fc"
  end

  resource "PyQt5-sip" do
    url "https://files.pythonhosted.org/packages/73/8c/c662b7ebc4b2407d8679da68e11c2a2eb275f5f2242a92610f6e5024c1f2/PyQt5_sip-12.8.1.tar.gz"
    sha256 "30e944db9abee9cc757aea16906d4198129558533eb7fadbe48c5da2bd18e0bd"
  end

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/a0/a4/d63f2d7597e1a4b55aa3b4d6c5b029991d3b824b5bd331af8d4ab1ed687d/PyYAML-5.4.1.tar.gz"
    sha256 "607774cbba28732bfa802b54baa7484215f530991055bb562efbed5b2f20a45e"
  end

  resource "aiohttp" do
    url "https://files.pythonhosted.org/packages/68/96/40a765d7d68028c5a6d169b2747ea3f4828ec91a358a63818d468380521c/aiohttp-3.7.3.tar.gz"
    sha256 "9c1a81af067e72261c9cbe33ea792893e83bc6aa987bfbd6fdc1e5e7b22777c4"
  end

  resource "async-timeout" do
    url "https://files.pythonhosted.org/packages/a1/78/aae1545aba6e87e23ecab8d212b58bb70e72164b67eb090b81bb17ad38e3/async-timeout-3.0.1.tar.gz"
    sha256 "0c3c816a028d47f659d6ff5c745cb2acf1f966da1fe5c19c77a70282b25f4c5f"
  end

  resource "attrs" do
    url "https://files.pythonhosted.org/packages/f0/cb/80a4a274df7da7b8baf083249b0890a0579374c3d74b5ac0ee9291f912dc/attrs-20.3.0.tar.gz"
    sha256 "832aa3cde19744e49938b91fea06d69ecb9e649c93ba974535d08ad92164f700"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/06/a9/cd1fd8ee13f73a4d4f491ee219deeeae20afefa914dfb4c130cfc9dc397a/certifi-2020.12.5.tar.gz"
    sha256 "1a4995114262bffbc2413b159f2a1a480c969de6e6eb13ee966d470af86af59c"
  end

  resource "chardet" do
    url "https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz"
    sha256 "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/ea/b7/e0e3c1c467636186c39925827be42f16fee389dc404ac29e930e9136be70/idna-2.10.tar.gz"
    sha256 "b307872f855b18632ce0c21c5e45be78c0ea7ae4c15c828c20788b26921eb3f6"
  end

  resource "importlib-resources" do
    url "https://files.pythonhosted.org/packages/e7/ef/8bf9f2469c2c0a1bf00c39b2a076f71c4e511a3014a296b50eb425a2633d/importlib_resources-5.1.0.tar.gz"
    sha256 "bfdad047bce441405a49cf8eb48ddce5e56c696e185f59147a8b79e75e9e6380"
  end

  resource "lxml" do
    url "https://files.pythonhosted.org/packages/db/f7/43fecb94d66959c1e23aa53d6161231dca0e93ec500224cf31b3c4073e37/lxml-4.6.2.tar.gz"
    sha256 "cd11c7e8d21af997ee8079037fff88f16fda188a9776eb4b81c7e4c9c0a7d7fc"
  end

  resource "multidict" do
    url "https://files.pythonhosted.org/packages/1c/74/e8b46156f37ca56d10d895d4e8595aa2b344cff3c1fb3629ec97a8656ccb/multidict-5.1.0.tar.gz"
    sha256 "25b4e5f22d3a37ddf3effc0710ba692cfc792c2b9edfb9c05aefe823256e84d5"
  end

  resource "pytz" do
    url "https://files.pythonhosted.org/packages/70/44/404ec10dca553032900a65bcded8b8280cf7c64cc3b723324e2181bf93c9/pytz-2020.5.tar.gz"
    sha256 "180befebb1927b16f6b57101720075a984c019ac16b1b7575673bea42c6c3da5"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/6b/47/c14abc08432ab22dc18b9892252efaf005ab44066de871e72a38d6af464b/requests-2.25.1.tar.gz"
    sha256 "27973dd4a904a4f13b263a19c866c13b92a39ed1c964655f025f3f8d3d75b804"
  end

  resource "ruamel.yaml" do
    url "https://files.pythonhosted.org/packages/17/2f/f38332bf6ba751d1c8124ea70681d2b2326d69126d9058fbd9b4c434d268/ruamel.yaml-0.16.12.tar.gz"
    sha256 "076cc0bc34f1966d920a49f18b52b6ad559fbe656a0748e3535cf7b3f29ebf9e"
  end

  resource "ruamel.yaml.clib" do
    url "https://files.pythonhosted.org/packages/fa/a1/f9c009a633fce3609e314294c7963abe64934d972abea257dce16a15666f/ruamel.yaml.clib-0.2.2.tar.gz"
    sha256 "2d24bd98af676f4990c4d715bcdc2a60b19c56a3fb3a763164d2d8ca0e806ba7"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/16/06/0f7367eafb692f73158e5c5cbca1aec798cdf78be5167f6415dd4205fa32/typing_extensions-3.7.4.3.tar.gz"
    sha256 "99d4073b617d30288f569d3f13d2bd7548c3a7e4c8de87db09a9d29bb3a4a60c"
  end

  resource "tzlocal" do
    url "https://files.pythonhosted.org/packages/ce/73/99e4cc30db6b21cba6c3b3b80cffc472cc5a0feaf79c290f01f1ac460710/tzlocal-2.1.tar.gz"
    sha256 "643c97c5294aedc737780a49d9df30889321cbe1204eac2c2ec6134035a92e44"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/29/e6/d1a1d78c439cad688757b70f26c50a53332167c364edb0134cadd280e234/urllib3-1.26.2.tar.gz"
    sha256 "19188f96923873c92ccb987120ec4acaa12f0461fa9ce5d3d0772bc965a39e08"
  end

  resource "yarl" do
    url "https://files.pythonhosted.org/packages/97/e7/af7219a0fe240e8ef6bb555341a63c43045c21ab0392b4435e754b716fa1/yarl-1.6.3.tar.gz"
    sha256 "8a9066529240171b68893d60dca86a763eae2139dd42f42106b03cf4b426bf10"
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
      PyQt5-sip
      certifi
      urllib3
      requests
      uiucprescon.ocr
      ruamel.yaml
      ruamel.yaml.clib
      tzlocal
      PyYAML
      pytz
      yarl
      multidict
      importlib-resources
      idna
      chardet
      attrs
      async-timeout
      typing-extensions
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
