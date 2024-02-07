FROM ubuntu:jammy-20240111 AS install
RUN mkdir app
COPY install.sh app
RUN chmod +x app/install.sh
RUN /app/install.sh

FROM scratch AS launch
LABEL org.opencontainers.image.authors = "github.com/al1ydn"
LABEL org.opencontainers.image.description = "Create an Aseprite Linux build with a Docker container image."
LABEL org.opencontainers.image.source = "https://github.com/al1ydn/aseprite-linux-build"
COPY --from=install /app/bin /app/bin