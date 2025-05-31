FROM ghcr.io/alt-atomic/alt-image:latest AS atomic-base

# Определяем тип сборки
ARG BUILD_TYPE="default"
ENV BUILD_TYPE=$BUILD_TYPE

# Выполняем все шаги в одном RUN для минимизации слоёв
RUN --mount=type=bind,source=./src,target=/src \
    /src/main.sh

# Стадия 2: Переход к пустому образу
FROM scratch

# Копируем всё содержимое из предыдущего образа
COPY --from=atomicBase / /

WORKDIR /

# Помечаем образ как bootc совместимый
LABEL containers.bootc=1

CMD ["/sbin/init"]


FROM atomicBase AS atomic-nvidia-base

# Определяем тип сборки
ARG BUILD_TYPE="default"
ENV BUILD_TYPE=$BUILD_TYPE

RUN --mount=type=bind,source=./src,target=/src \
    apt-get update && \
    /src/make/00-atomic-actions.sh && \
    /src/packages/02-nvidia-packages.sh && \
    /src/configuration/02-nvidia.sh && \
    /src/configuration/03-kernel.sh && \
    /src/packages/03-apt-ending.sh
