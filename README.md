# chainctl_docker

<<<<<<< copilot/add-public-image-building
A Docker image that packages Chainguard's [chainctl](https://edu.chainguard.dev/chainguard/chainctl/) CLI tool for easy distribution and use in containerized environments.

## Features

- 🔄 **Automated Builds**: Daily scheduled builds and builds on every push to main
- 📦 **Public Image**: Available at `ghcr.io/dalejrodriguez/chainctl_docker`
- 🔐 **Signed Images**: All images are signed with Cosign for supply chain security
- 🏗️ **Multi-stage Build**: Optimized image size using Chainguard base images
- 🔑 **Headless Authentication**: Built-in support for identity token-based authentication

## Usage

### Basic Usage

Run chainctl commands by passing them as arguments:

```bash
docker run --rm \
  --env identity="your-identity" \
  --env identity_token="your-token" \
  ghcr.io/dalejrodriguez/chainctl_docker:main \
  chainctl img list --parent=example.com
```

### Environment Variables

- `identity`: The username from your Chainguard pull token
- `identity_token`: The password from your Chainguard pull token

### Examples

List images:
```bash
docker run --rm \
  --env identity="your-identity" \
  --env identity_token="your-token" \
  ghcr.io/dalejrodriguez/chainctl_docker:main \
  chainctl img list
```

Get help:
```bash
docker run --rm \
  --env identity="your-identity" \
  --env identity_token="your-token" \
  ghcr.io/dalejrodriguez/chainctl_docker:main \
  chainctl --help
```

## Building Locally

To build the Docker image locally:

```bash
docker build -t chainctl-image:latest .
```

To test the local build:

```bash
docker run --rm \
  --env identity="your-identity" \
  --env identity_token="your-token" \
  chainctl-image:latest \
  chainctl --version
```

## CI/CD

This repository uses GitHub Actions to automatically:

1. **Build** the Docker image on every push to main
2. **Publish** to GitHub Container Registry (ghcr.io)
3. **Sign** the image using Cosign for supply chain security
4. **Schedule** daily builds to keep the chainctl binary up to date

The workflow is defined in `.github/workflows/docker-publish.yml`.

## Image Details

- **Base Images**: Uses Chainguard's minimal images for security and size optimization
- **Download Source**: Latest chainctl binary from https://dl.enforce.dev/chainctl/latest/
- **Architecture Support**: Automatically detects and downloads the appropriate binary for the build platform
- **Non-root User**: Runs as non-root user (UID 65532) for security

## License

This repository is for building and distributing the chainctl Docker image. The chainctl tool itself is provided by Chainguard. Please refer to Chainguard's licensing terms for the chainctl binary.
=======
This is a dockerized version of chainctl. 

This version is a side project and not an official release from chainguard. 

Usage:

 docker run --rm \
   --env identity="foo" \
   --env identity_token="bar" \
   chainctl-image:latest \
  chainctl img list --parent=example.com

>>>>>>> main
