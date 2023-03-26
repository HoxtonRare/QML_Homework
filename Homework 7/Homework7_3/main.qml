import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15


Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Homework7_3")

    Button {
        text: "Открыть popup"
        onClicked: popup.open()
    }

    Popup {
        id: popup
        x: 100
        y: 100
        width: 200
        height: 300
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
        background: Rectangle {
            anchors.fill: parent
            radius: 10
        }

        Text {
            anchors.centerIn: parent
            text: "Скругленный Popup"
        }
    }

    TCombobox {
        id: tCombobox
        x: 200
        model: ["A", "B", "C"]
    }
}

