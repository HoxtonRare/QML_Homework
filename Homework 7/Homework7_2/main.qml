import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15


Window {
    width: 640
    height: 480

    visible: true
    title: qsTr("Homework7_2")

    function getFriendsText(friends){
        var resString = ""
        for(const friend of friends){
            resString += friend + ", "
        }
        return resString.slice(0, -2);
    }

    ListView {
        anchors.fill: parent
        model: mdl
        spacing: 2
        delegate: SwipeView {
            width: parent.width
            height: 50
            Item {
                Row {
                    anchors.fill: parent
                    spacing: 2
                    Rectangle {
                        id: rowIds
                        width: 70
                        height: parent.height
                        border.width: 1
                        Text{
                            anchors.centerIn: parent
                            text: rowId
                        }
                    }

                    Rectangle {
                        width: 100
                        height: parent.height
                        border.width: 1
                        Text {
                            anchors.centerIn: parent
                            text: name
                        }
                    }

                    Rectangle {
                        width: 100
                        height: parent.height
                        border.width: 1
                        Text {
                            anchors.centerIn: parent
                            text: surname
                        }
                    }
                }
            }
            Item {
                Rectangle{
                    id: recs
                    width: 50
                    height: parent.height
                    border.width: 1
                    Text{
                        anchors.centerIn: parent
                        text: "friends: "
                    }
                }

                Rectangle {
                    width: 150
                    height: parent.height
                    border.width: 1
                    anchors.left: recs.right
                    Text {
                        anchors.fill: parent
                        text: getFriendsText(friends)
                        wrapMode: Text.WordWrap
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
        }
        header: Row {
            width: parent.width
            height: 50
            spacing: 2

            Rectangle {
                width: 70
                height: parent.height
                border.width: 1
                Text {
                    anchors.centerIn: parent
                    text: "rowId"
                }
            }

            Rectangle {
                width: 100
                height: parent.height
                border.width: 1
                Text {
                    anchors.centerIn: parent
                    text: "name"
                }
            }

            Rectangle {
                width: 100
                height: parent.height
                border.width: 1
                Text {
                    anchors.centerIn: parent
                    text: "surname"
                }
            }

        }
    }
}
