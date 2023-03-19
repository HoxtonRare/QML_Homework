import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.12

import "createApp.js" as CreateApp

Window {
    id: primaryFrame
    width: 640
    height: 480
    visible: true
    title: qsTr("Homework")
    color: "#e5ecef"

    property bool isInput: false

    Component.onCompleted: CreateApp.createStartPage(primaryFrame);

    Component {
            id: page1
            Rectangle {
                width: primaryFrame.width
                height: primaryFrame.height
                color: "dark red"

                Label{
                    text: "Page 1"
                    anchors.centerIn: parent
                }

                Button{
                    id: nextButton
                    text: "Next page"
                    anchors.bottom: parent.bottom
                    onClicked:{
                        loader.sourceComponent = page2
                    }
                }

            }
        }

        Component {
            id: page2
            Rectangle {
                width: primaryFrame.width
                height: primaryFrame.height
                color: "Gray"

                Label{
                    text: "Page 2"
                    anchors.centerIn: parent
                }

                Button{
                    id: prevButton
                    text: "Previous page"
                    anchors.bottom: parent.bottom
                    onClicked:{
                        loader.sourceComponent = page1
                    }
                }

            }
        }

        Loader{
            id: loader
        }
}
