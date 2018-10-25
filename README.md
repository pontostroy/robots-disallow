# robots-disallow
robots-disallow implements a http server serving content of a robots.txt file disallowing all robots.
    Usage:
      robots-disallow [OPTIONS]

    Application Options:
          --listen=  address to listen on (default: 0.0.0.0:9070) [$ROBOTS_DISALLOW_LISTEN]
      -v, --version  show version number

    Help Options:
      -h, --help     Show this help message

## Example
    docker run -p 9070:9070 -v "$(pwd)"/robots.txt:/robots.txt pontostroy/robots-disallow

## Output
    curl localhost:9070
    User-agent: *
    Disallow: /
