ARG IMAGE="altlinux.space/alt-atomic/base/stable:latest"

FROM $IMAGE AS atomic-base

ARG BUILD_TYPE="default"
ARG IMAGE_TYPE="stable"

ENV IMAGE_TYPE=$IMAGE_TYPE
ENV BUILD_TYPE=$BUILD_TYPE

# Выполняем все шаги в одном RUN для минимизации слоёв
RUN --mount=type=bind,source=./src,target=/src \
    /src/main.sh

# Стадия 2: Переход к пустому образу
FROM scratch

# Копируем всё содержимое из предыдущего образа
COPY --from=atomic-base / /

WORKDIR /

# Помечаем образ как bootc совместимый
LABEL containers.bootc=1

LABEL org.opencontainers.image.title="ALT Atomic Onyx"
LABEL org.opencontainers.image.description="ALT Atomic with GNOME"
LABEL org.opencontainers.image.source="https://altlinux.space/alt-atomic/onyx"
LABEL org.opencontainers.image.licenses="GPL-3.0-or-later"
LABEL org.opencontainers.image.vendor="ALT Linux Team"

CMD ["/sbin/init"]
