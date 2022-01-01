# docker-base-s6 [![Build Status](https://jenkins.bln.space/buildStatus/icon?job=docker-images%2Fdocker-base-s6%2Fmaster)](https://jenkins.bln.space/job/docker-images/job/docker-base-s6/job/master/)

Forked from [robbertkl/base-s6](https://github.com/robbertkl/docker-base-s6) with original author Robbert Klarenbeek, <robbertkl@renbeek.nl>, thank you!

## Usage

Just extend it in your `Dockerfile` using `FROM`. Example:

```
FROM registry.n-os.org:5000/base-s6

RUN cleaninstall package1 package2 package3
RUN echo /var/log/custom.log >> /etc/services.d/logs/stderr

...
```

## Logging

To have your custom logs show up in `docker logs`, you can append your name to either `/etc/services.d/logs/stdout` or `/etc/services.d/logs/stderr`.


## License

This repo is published under the [MIT License](http://www.opensource.org/licenses/mit-license.php).
