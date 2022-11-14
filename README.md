# Fiberplane publish event action

This GitHub action will allow you to post an event to Fiberplane

# Usage

First, create a Fiberplane API token and [set it up as a GitHub secret][0] 
named `FIBERPLANE_TOKEN` in your GitHub repository or organization.

Then add the following step to a workflow of your choice:

```
    # ...
    steps:
      # ...
      - uses: fiberplane/publish-event@v1.1
        with:
          # Required. Do *not* put your plaintext secret here
          api-token: ${{ secrets.FIBERPLANE_TOKEN }}
          # Required
          title: "API Deployment using GitHub Actions"
          # Format: key=optional value, separated with |. At least one label is required
          labels: "product=api|type=deploy"
```

[0]: https://docs.github.com/en/actions/security-guides/encrypted-secrets#creating-encrypted-secrets-for-a-repository
