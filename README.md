# spring-format

This library adds dependency graphs to your Node repos by wrapping [dependency-cruiser](https://www.npmjs.com/package/dependency-cruiser).

## Development

```
docker build --tag springrod:dependency-cruiser .
docker run springrod:dependency-cruiser  
docker tag springrod:dependency-cruiser springrod/dependency-cruiser
docker push springrod/dependency-cruiser                           

```

Created by [Atomist][atomist].
Need Help? [Join our Slack team][slack].

[atomist]: https://www.atomist.com/
[slack]: https://join.atomist.com/
