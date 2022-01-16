# FishingGuard

Бот для Discord, предназначенный для защиты от фишинговых ссылок. Умеет отслеживать подозрительные сообщения на серверах, удалять их и исключать с сервера авторов таких сообщений, оповещая их при этом.

![Демонстрация работы](https://img.share.superhub.xyz/54pcxq.png)

## Зачем и почему?

В один прекрасный день на просторах Discord появился некто, преследующий не до конца понятные мне цели, рассылающий фишинговые ссылки, пополняющий коллекцию аккаунтов в Discord, чтобы рассылать ещё больше фишинговых ссылок. Этот некто из России размещает всё необходимое для своих деяний на msk.host (он же aeza.net), хорошо известном из-за взлома со стороны людей, которым не всё равно, что там происходит ([подробнее](https://habr.com/ru/news/t/577468/), [ещё более подробно](https://t.me/mskhostohoh)).

В итоге из-за прикрытия всего этого фишинга со стороны хостинг-провайдеров, обеспечение защиты пользователей Discord от опасных ссылок стало задачей администраторов серверов, одним из которых я и являюсь. Собственно, учитывая особенности конкретно этого фишинга, я разработал этого бота.

## Как это работает?

Как уже сказано выше, все сайты размещаются у msk.host, имеющего определённые диапазоны IP адресов. Поскольку администрация сего хостинга активно покрывает противоправные деяния, противоречащие даже их собственным "условиям использования", помимо подобного фишинга там достаточно мошеннических сайтов.

Собственно, работает это предельно просто. Бот просто сканирует все сообщения, доставая из них все ссылки. Из ссылок достаётся имя хоста, по нему определяется IP адрес, который в свою очередь проверяется на факт того, принадлежит он пресловутому хостингу или нет. Если да, то бот обрабатывает сообщение как подозрительное, а в остальных случаях просто игнорирует его. Таким образом мы избавляемся не только от фишинга, но и от других нежелательных сайтов, размещающихся на msk.host.

## Как использовать?

Самый простой способ - [добавить готового бота](https://discord.com/oauth2/authorize?client_id=874560372126928946&scope=bot&permissions=8195). Он уже настроен и будет сканировать все сообщения, к которым имеет доступ.

Более сложный способ - скомпилировать его и запустить:

```bash
# клонируем репозиторий
git clone https://github.com/RuscalWorld/FishingGuard
cd FishingGuard
# компилируем бота
./gradlew build

# запускаем
export FG_BOT_TOKEN=<токен бота> # или $env:FG_BOT_TOKEN=<токен бота> в PowerShell
java -cp build/libs/FishingGuard-1.0-all.jar ru.ruscalworld.fishingguard.FishingGuard
```

Можно также использовать Docker. Текущий образ находится в приватном репозитории, поэтому собрать придётся самостоятельно:

```bash
# сначала клонировать репозиторий и скомпилировать (см. выше)
docker build -t ruscalworld/fishing-guard .
docker volume create fishing-guard-data
docker run -v fishing-guard-data:/root -e FG_BOT_TOKEN=<токен бота> ruscalworld/fishing-guard
```