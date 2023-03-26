import QtQuick 2.15
import QtQuick.Window 2.15
import Qt.labs.qmlmodels 1.0
import QtQuick.LocalStorage 2.15 as SQL
import QtQuick.Controls 2.12


import "func.js" as Functions

Window {
    id: mainWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("Homework7_1")

    property int cellHorizontalSpacing: 10
    readonly property int tableDelegatHeight: 50
    property int currentIndex
    property var rowObj

    property var db

    TableModel {
        id: tableModel
        TableModelColumn { display: "id" }
        TableModelColumn { display: "first_name" }
        TableModelColumn { display: "last_name" }
        TableModelColumn { display: "email" }
        TableModelColumn { display: "phone" }
        rows: []


    }

    function getRowIndex(x){
        for(let ix = 0; ix < tableModel.rowCount; ix++){
            if(x >= (tableDelegatHeight * ix)  &&  x < tableDelegatHeight * (1+ix)) return ix
        }
    }

    Column {
        anchors.fill: parent
        ComboBox {
            width: 200
            height: 50

        }

        TableView {
            id: table
            width: mainWindow.width
            height: tableModel.rowCount * tableDelegatHeight
            columnSpacing: 1
            rowSpacing: 1
            model: tableModel
            clip: true



            delegate: Rectangle {
                id: tableDelegat

                implicitWidth: Math.max( 100, /*left*/ cellHorizontalSpacing + innerText.width + /*right*/ cellHorizontalSpacing )
                implicitHeight: tableDelegatHeight
                border.width: 1

                Text {
                    id: innerText
                    text: display
                    anchors.centerIn: parent
                }
            }

            MouseArea {
                id: mouse
                anchors.fill: parent

                onClicked: {
                    currentIndex = getRowIndex(mouse.y)
                    rowObj = tableModel.getRow(currentIndex)
                    updateDialog.open()
                }
            }
        }
    }

    Dialog {
        id: dialog
        anchors.centerIn: parent
        title: "Добавить человека"
        standardButtons: Dialog.Ok | Dialog.Cancel
        Column {
            anchors.fill: parent
            spacing: 5
            TextField {
                id: firstName
                placeholderText: "Имя"
            }
            TextField {
                id: lastName
                placeholderText: "Фамилия"
            }
            TextField {
                id: email
                placeholderText: "E-mail"
            }
            TextField {
                id: phone
                placeholderText: "Номер телефона"
                inputMask: "+7(999)-999-99-99"
            }
        }
        onAccepted: {
                db.transaction((tx) => {
                                   let resObj = Functions.addContact(tx, firstName.text,
                                                                       lastName.text,
                                                                       email.text,
                                                                       phone.text);
                                   if (resObj.rowsAffected !== 0) {
                                       tableModel.appendRow({
                                                                id: resObj.insertId,
                                                                first_name: firstName.text,
                                                                last_name: lastName.text,
                                                                email: email.text,
                                                                phone: phone.text
                                                            })
                                   }
                               })
        }
    }


    Dialog {
        id: updateDialog
        anchors.centerIn: parent
        title: "Обновление информации"
        standardButtons: Dialog.Ok | Dialog.Cancel
        Column {
            anchors.fill: parent
            spacing: 5
            TextField {
                id: updateFirstName
                text: rowObj.first_name
                placeholderText: "Имя"
            }
            TextField {
                id: updateLastName
                text: rowObj.last_name
                placeholderText: "Фамилия"
            }
            TextField {
                id: updateEmail
                text: rowObj.email
                placeholderText: "E-mail"
            }
            TextField {
                id: updatePhone
                text: rowObj.phone
                inputMask: "+9(999)-999-99-99"
            }
        }
        onAccepted: {

            rowObj.first_name = updateFirstName.text
            rowObj.last_name = updateLastName.text
            rowObj.email = updateEmail.text
            rowObj.phone = updatePhone.text


                db.transaction((tx) => { Functions.updateContact(tx, rowObj, currentIndex + 1)})
                tableModel.setRow(currentIndex, {
                                      id: currentIndex,
                                      first_name: rowObj.first_name,
                                      last_name: rowObj.last_name,
                                      email: rowObj.email,
                                      phone: rowObj.phone
                                  })
        }

    }

    Button {
        id: button
        text: "Добавить человека"
        width: parent.width
        height: 50
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: dialog.open()
    }


    Component.onCompleted: {
        var data_array = ListModel

        db = SQL.LocalStorage.openDatabaseSync("DBExample", "1.0", "Пример локальной базы данных", 1000)
        db.transaction(Functions.createSimpleTable);
        db.transaction((tx) => { Functions.readContacts(tx, table.model) })



    }
}
