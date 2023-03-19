import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.12

import "createApp.js" as CreateApp

Item {
    id: loginForm
    anchors.fill: parent
    property string login: "login"
    property string password: "password"

    function checkCredentials() {
        if (login === loginTextField.text
            && password === passwordTextField.text){
            CreateApp.loadApp()
            loginForm.destroy()

    } else
            failAnimation.start()
    }

    Rectangle {
        id: secondaryFrame
        color: "white"
        anchors.centerIn: parent
        radius: 5
        width: 300
        height: 250
        property string textColor: "#535353"
            Column {
                anchors.fill: parent
                spacing: 32
                TextField {
                    id: loginTextField
                    anchors.horizontalCenter: parent.horizontalCenter
                    placeholderText: qsTr("Логин")
                    color: secondaryFrame.textColor
                    Keys.onEnterPressed: checkCredentials()
                    Keys.onReturnPressed: checkCredentials()

                }
                TextField {
                    id: passwordTextField
                    echoMode: TextInput.Password
                    anchors.horizontalCenter: parent.horizontalCenter
                    placeholderText: qsTr("Пароль")
                    color: secondaryFrame.textColor
                    Keys.onEnterPressed: checkCredentials()
                    Keys.onReturnPressed: checkCredentials()

                }
                Button {
                    id: submitButton
                    width: 200
                    height: 40
                    background: Rectangle {
                        color: parent.down ? "#bbbbbb" :
                        (parent.hovered ? "#d6d6d6" : "#f6f6f6")
                    }
                    text: qsTr("Вход")
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: checkCredentials()
                }
            }
    }

    ParallelAnimation{
        id: failAnimation
        SequentialAnimation {
            PropertyAnimation {
                targets: [loginTextField, passwordTextField]
                property: "color"
                to: "dark red"
                duration: 0
                }
                PropertyAnimation {
                    targets: [loginTextField, passwordTextField]
                    property: "color"
                    to: secondaryFrame.textColor
                    duration: 400

            }
        }

        SequentialAnimation {
            NumberAnimation { target: secondaryFrame; property:
            "anchors.horizontalCenterOffset"; to: -5; duration: 50 }
            NumberAnimation { target: secondaryFrame; property:
            "anchors.horizontalCenterOffset"; to: 5; duration: 100 }
            NumberAnimation { target: secondaryFrame; property:
            "anchors.horizontalCenterOffset"; to: 0; duration: 50 }
        }
    }
}
