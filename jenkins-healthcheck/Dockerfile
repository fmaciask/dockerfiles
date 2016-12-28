FROM jenkins:alpine
HEALTHCHECK --interval=5s --timeout=3s CMD curl --fail http://localhost:8091/pools || exit 1
