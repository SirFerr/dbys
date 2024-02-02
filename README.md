Данное задание сделанно с помощью QML компонента DBusAdaptor

С помощью DBusAdaptor был создан сервис с методами: 

registerFormatAndLaunchMethods(format,launch): принимает на вход название формата и путь к сервису который будет его запускать;

getLaunch(format): возвращает по названию путь к сервису для запуска.

Для работы с созданным сервисом был использован компонент DBusInterface, у которого есть методы:

function registerFormatAndLaunchMethods(format,launchMethod): вызывает метод сервиса registerFormatAndLaunchMethods;

function getLaunch(format,callback): вызывает метод getLaunch и возвращает callback-ом метод запуска (т.к. call работет асинхронно).

Для проверки был создан простой ui состоящий из элементов: Text, TextField, Button.

![image](https://github.com/SirFerr/dbys/assets/7862646/3d05f26b-f850-48e8-8f2b-9009e0602539)
