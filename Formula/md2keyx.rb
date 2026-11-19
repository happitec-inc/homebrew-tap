class Md2keyx < Formula
  include Language::Python::Virtualenv

  desc "Compile Markdown decks into Keynote Interchange Format (.keyx) presentations"
  homepage "https://github.com/happitec-inc/md2keyx"
  url "https://github.com/happitec-inc/md2keyx.git",
      tag:      "v0.1.0",
      revision: "5c32a6c261a3f6cee568a36b60daf86d3785fe3d"
  version "0.1.0"
  license "MIT"
  head "https://github.com/happitec-inc/md2keyx.git", branch: "main"

  # pydantic-core is built from its sdist, which needs a Rust toolchain.
  depends_on "rust" => :build
  depends_on "libyaml"
  depends_on "python@3.14"

  # Runtime dependencies, pinned to the versions in md2keyx's uv.lock at v0.1.0.
  # Keep `version` above this block: the tap bump rewrites the first `version` line.
  resource "annotated-types" do
    url "https://files.pythonhosted.org/packages/5f/56/a8120250d128bed162cd73c76d45f6ef9991f3e068f62a8ee060afa3104a/annotated_types-0.8.0.tar.gz"
    sha256 "13b2beaad985e05e2d6407ee4c4f35590b11f8d693a258a561055cac8f64cab7"
  end

  resource "creator-studio-doc-format" do
    url "https://files.pythonhosted.org/packages/71/e0/25e5deb7568383f7f8b04b67a777df426e3ecea4461c7f8ffd97665987bd/creator_studio_doc_format-0.1.0.tar.gz"
    sha256 "02274a037fdc4cde32f204971fa9b17cb75a8fa026ffc7269c0a20747be3af20"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/16/fc/cee2c45553c9a9bf77d8b0c391560c556d7ed756b1f0bb35eb5d48db09ea/markdown_it_py-4.3.0.tar.gz"
    sha256 "91a58fa5b72c71a40cf7177250fd767480d7a2bb3ac426ccfb76fb90305fdaaa"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/b4/fc/1203d011145c98ddce3cd2f505bb54375ef8d43223053df6bfcf3c746f46/pydantic-2.14.3.tar.gz"
    sha256 "1054f237f4d4733e5a30e1e2333bd33a2004ab9ab1510bd053a9a31bb48e232d"
  end

  resource "pydantic-core" do
    url "https://files.pythonhosted.org/packages/9c/0f/34f9ce4ba701dd0b815033ef94d99b56f66200e578ee6052aa3ac26f064e/pydantic_core-2.50.4.tar.gz"
    sha256 "aead3b74b68396bf0feab5d57e050b730ded7df55853c1e048a87e00aaf033c6"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/f6/cc/6253133b5bb138fc3306cebfbda2c520f545d36b5be2c7255cc528bb45d6/typing_extensions-4.16.0.tar.gz"
    sha256 "dc983d19a509c94dba722ee6abd33940f7c05a89e243c47e907eb4db6f1a43e5"
  end

  resource "typing-inspection" do
    url "https://files.pythonhosted.org/packages/ff/50/0195198eb1d75bab716bb0a813abea4cc394bfa17a92a189f021a34859af/typing_inspection-0.4.5.tar.gz"
    sha256 "7f16c411e7930dc79596d42ab44672a3fe5f60eb34b781a1647e7872363120c7"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    (testpath/"deck.md").write <<~MD
      # Hello

      First slide.

      ---

      # Second

      - one
      - two
    MD
    output = shell_output("#{bin}/md2keyx #{testpath}/deck.md -o #{testpath}/deck.keyx")
    assert_match "Compiled 2 slides", output
    assert_path_exists testpath/"deck.keyx"
  end
end
