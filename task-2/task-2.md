## Задание 2*
Создайте в облаке ВМ. Сделайте это через web-консоль, чтобы не слить по незнанию токен от облака в github(это тема следующей лекции). Если хотите - попробуйте сделать это через terraform, прочитав документацию yandex cloud. Используйте файл personal.auto.tfvars и гитигнор или иной, безопасный способ передачи токена!
Подключитесь к ВМ по ssh и установите стек docker.
Найдите в документации docker provider способ настроить подключение terraform на вашей рабочей станции к remote docker context вашей ВМ через ssh.

### Настройка remote context в docker:

Для удобства создадим ssh config:

![ssh](https://github.com/stkv1/ter-homework-01/blob/main/pic/129.PNG)

Убедимся, что с помощью конфига можно успешно подключиться к ВМ в облаке:

![ssh](https://github.com/stkv1/ter-homework-01/blob/main/pic/130.PNG)

Создадим docker context

`docker context create yandex --docker "host=ssh://vm-yandex"`

`docker context use yandex`

![context](https://github.com/stkv1/ter-homework-01/blob/main/pic/141.PNG)

Используя terraform и remote docker context, скачайте и запустите на вашей ВМ контейнер mysql:8 на порту 127.0.0.1:3306, передайте ENV-переменные. Сгенерируйте разные пароли через random_password и передайте их в контейнер, используя интерполяцию из примера с nginx.(name  = "example_${random_password.random_string.result}" , двойные кавычки и фигурные скобки обязательны!)
    environment:
      - "MYSQL_ROOT_PASSWORD=${...}"
      - MYSQL_DATABASE=wordpress
      - MYSQL_USER=wordpress
      - "MYSQL_PASSWORD=${...}"
      - MYSQL_ROOT_HOST="%"
Зайдите на вашу ВМ , подключитесь к контейнеру и проверьте наличие секретных env-переменных с помощью команды env. Запишите ваш финальный код в репозиторий.
