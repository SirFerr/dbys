import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.DBus 2.0
import QtQml 2.0


Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    DBusAdaptor {
            id: dbusAdaptor

            property var listFormat:({})

            service: 'com.example.dbusReg'
            iface: 'com.example.dbusReg'
            path: '/com/example/dbusReg'

            xml: '  <interface name="com.example.service">\n' +
                 '    <method name="registerFormatAndLaunchMethods" />\n'+
                 '    <method name="getList">\n'+
                 '      <arg type="s" direction="out"/>\n' +
                 '    </method>\n' +
                 '  </interface>\n'


            function registerFormatAndLaunchMethods(format,launch){
                listFormat[format]=launch
            }

            function getList(){
                return JSON.stringify(listFormat);
            }

        }


    DBusInterface{
        id: dbusInterface
        service: 'com.example.dbusReg'
        iface: 'com.example.dbusReg'
        path: '/com/example/dbusReg'


        function registerFormatAndLaunchMethods(format,launchMethod) {
           call('registerFormatAndLaunchMethods',[format,launchMethod])
        }



        function getList(){
            var listFormat =call('getList',function(reply){
                for (var key in reply){
                console.log(key)
                }
                console.log()
            })


        }
    }
    Column{
        id: column


        PageHeader {
            title: qsTr("DbusTest")
        }
        TextField{
        id: formatTextField
        text: "txt"
        }
        TextField{
        id: launchTextField
        text: "1"
        }
        Button{

                id: buttonReg
                text: "reg"
                onClicked: {
                    console.log('click')
                    dbusInterface.registerFormatAndLaunchMethods(
                                formatTextField.text,
                                launchTextField.text)
                }

         }
        Button{

                id: buttonGetList
                text: "get"
                onClicked: {
                    console.log('click')
                    dbusInterface.getList()
                }

         }

}

}


