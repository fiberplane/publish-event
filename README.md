# Fiberplane publish event action

This GitHub action will allow you to post an event to Fiberplane

# Usage

Add the following step to a workflow of your choice:

```
    # ...
    steps:
      # ...
      - uses: fiberplane/publish-event@v1
        with:
          api-token: ${{ secrets.FIBERPLANE_TOKEN }}
          title: "API Deployment using GitHub Actions"
          labels: "product=api|type=deploy"
```
