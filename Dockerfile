# Dockerfile for Quarto project with Temple brand
FROM ubuntu:22.04

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    wget \
    git \
    ca-certificates \
    pandoc \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-xetex \
    texlive-luatex \
    texlive-pictures \
    fonts-lmodern \
    cm-super \
    && rm -rf /var/lib/apt/lists/*

# Install Quarto via deb package (latest version for Temple brand compatibility)
RUN curl -fsSL https://github.com/quarto-dev/quarto-cli/releases/download/v1.6.39/quarto-1.6.39-linux-amd64.deb -o quarto.deb \
    && apt-get update \
    && apt-get install -y ./quarto.deb \
    && rm quarto.deb \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /project

# Copy project files
# NOTE: assets under _extensions/titlepage/{fonts,images} are tracked with Git LFS
# (see .gitattributes). This COPY only picks up whatever bytes are already in the
# build context, so the host checkout must have run `git lfs pull` beforehand --
# otherwise these are ~130-byte pointer stubs, not real font/image data.
COPY . .

# Fail the build loudly if LFS pointer files slipped through instead of real content,
# rather than surfacing as a confusing "font not found" error deep in a later render.
RUN size=$(stat -c%s _extensions/titlepage/fonts/qualitype/opentype/QTDublinIrish.otf) \
    && [ "$size" -gt 1000 ] || (echo "ERROR: _extensions/titlepage font/image assets look like Git LFS pointer stubs, not real files. Run 'git lfs pull' in the build context before 'docker build'." && exit 1)

# Verify Quarto installation
RUN quarto --version

# Set entrypoint for Quarto
ENTRYPOINT ["quarto"]
CMD ["--help"]
