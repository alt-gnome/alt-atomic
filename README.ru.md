# ALT Atomic Onyx

Неизменяемый образ с рабочим окружением GNOME, основанный на https://altlinux.space/alt-atomic/core

Документация: https://atomic.alt-gnome.ru/

### Образы

`onyx/nightly:<date>`
`onyx/nightly:latest`

Обновляется на основе каждого изменения в репозитории, используя основную ветку и на ежедневной основе. Изменения во внешних ветках загружаются под именем onyx/nightly-branch:<название ветки> в целях тестирования.

`onyx/stable:<date>`
`onyx/stable:<git-tag>`
`onyx/stable:latest`

Собирается тоже ежедневно, но может быть заморожен.

В хранилище OCI хранится до 50 версий каждого образа. Срок действия всех версий, за исключением последней, составляет до 30 дней.

# Owners

- Владимир Романов <rirusha@altlinux.org>
- Дмитрий Удалов <udalov@altlinux.org>
