import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Homework2")

    Rectangle{
        id: rect
        color: "dark red"
        radius: 5
        anchors.centerIn: parent
        width: 300
        height: 300
        MouseArea{
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                if(mouse.button & Qt.LeftButton){
                    var num = Math.ceil(Math.random() * 8)
                    switch(num % 8){
                    case 0:
                        parent.color = "black"
                        break;
                    case 1:
                        parent.color = "blue"
                        break;
                    case 2:
                        parent.color = "grey"
                        break;
                    case 3:
                        parent.color = "green"
                        break;
                    case 4:
                        parent.color = "dark red"
                        break;
                    case 5:
                        parent.color = "pink"
                        break;
                    case 6:
                        parent.color = "brown"
                        break;
                    case 7:
                        parent.color = "orange"
                        break;
                    }
                }
                if(mouse.button & Qt.RightButton)
                {
                    rightClickedAnim.running = true
                }
            }
            onDoubleClicked: {
                doubleClickedAnim.running = true
            }
        }
    }
    PropertyAnimation {
        id: doubleClickedAnim
        target: rect
        duration: 100
        property: "radius"
        to: 300
    }
    PropertyAnimation{
        id: rightClickedAnim
        target: rect
        duration: 1000
        property: "rotation"
        from: 0
        to: 360
    }
}

