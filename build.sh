main() {
  HUGO_VERSION=0.151.0

  export TZ=Europe/Oslo

  # Install Hugo
  echo "Installing Hugo v${HUGO_VERSION}..."
  curl -LJ0 https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz
  tar -xf "hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz"
  cp hugo /opt/buildhome
  rm LICENSE README.md hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz

  # Verify installed versions
  echo "Verifying installations..."
  echo Go: "$(go version)"
  echo Hugo: "$(hugo version)"
  echo Node.js: "$(node --version)"

  # Clone themes repository
  echo "Clone Console Theme..."
  git submodule update --init --recursive
  git config core.quotepath false

  # Building the site
  echo "Building the site..."
  hugo --gc --minify

}

set -euo pipefail
main "$@"