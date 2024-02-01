import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.DBus 2.0
import QtQml 2.0


Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    DBusAdaptor {

            property var listFormat:({})

            service: 'com.example.dbusReg'
            iface: 'com.example.dbusReg'
            path: '/com/example/dbusReg'

            xml: '  <interface name="com.example.service">\n' +
                 '    <method name="registerFormatAndLaunchMethods" />\n'+
                 '    <method name="getLaunch">\n'+
                 '      <arg type="s" direction="out"/>\n' +
                 '    </method>\n' +
                 '  </interface>\n'


            function registerFormatAndLaunchMethods(format,launch){
                listFormat[format]=launch
                console.log(format)
            }

            function getLaunch(format){
                return listFormat[format];
            }


        }


    DBusInterface{
        id: dbusInterface
        service: 'com.example.dbusReg'
        iface: 'com.example.dbusReg'
        path: '/com/example/dbusReg'
        property string formatGetted


        function registerFormatAndLaunchMethods(format,launchMethod) {
           call('registerFormatAndLaunchMethods',[format,launchMethod])
        }



        function getLaunch(format,callback){
            call("getLaunch", format, function (result) {
                       formatGetted = result
                       callback(result)
                   })
        }
    }
    PageHeader {
        title: qsTr("DbusTest")
    }

    Column{
            id: column
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter : parent.verticalCenter

            property string format:""

            Text{
            text: column.format
            color: "#FFFFFF"
            anchors.horizontalCenter: parent.horizontalCenter
            }
            TextField{
                id: formatTextField
                text: "txt"
            }
            TextField{
                id: launchTextField
                text: "com.example.example"
            }
            Button{
                    id: buttonReg
                    text: "reg"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                        console.log('click')
                        dbusInterface.registerFormatAndLaunchMethods(
                                    formatTextField.text,
                                    launchTextField.text)
                    }
             }
            Button{
                    id: buttonGet
                    text: "get"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                        console.log('click')
                        dbusInterface.getLaunch(
                                    formatTextField.text
                                    ,function(result){
                                        column.format = result
                        })
                    }

             }
    }



}


