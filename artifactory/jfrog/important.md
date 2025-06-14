### 📦 Artifact Publishing

This project was initially designed to publish build artifacts (e.g., Python wheels or tarballs) to **JFrog Artifactory**. However, as JFrog's full capabilities require a paid subscription for private, production-grade repositories and larger storage limits, this integration is currently paused.

> 💡 **Note:** Due to budget limitations, artifact publishing to JFrog is disabled for now. All packages are stored locally or via alternative free registries (e.g., GitHub Packages or Cloudsmith Free Tier).

You can re-enable JFrog publishing by configuring your credentials and repository URL in GitHub Secrets:

- `ARTIFACTORY_URL`
- `ARTIFACTORY_USERNAME`
- `ARTIFACTORY_PASSWORD`

And updating the GitHub Actions workflow accordingly.