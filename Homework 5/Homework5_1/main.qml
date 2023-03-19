import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import "coords.js" as Coords


Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    Canvas {
        id: mycanvas
        anchors.fill: parent
        property int xStep: width / 6
        property int yStep: height / 5
        onPaint: {
            var ctx = getContext("2d");
            ctx.clearRect(0, 0, width, height);
            ctx.fillStyle = Qt.rgba(1,1,1,1);
            Coords.printFigure(ctx, xStep, yStep, currentFigure.currentIndex);
            ctx.lineWidth = 15;
            ctx.stroke();
            ctx.fill();
        }
    }
    ComboBox {
        id: currentFigure
        model: ["Звёздочка", "Кольцо", "Домик", "Песочные часы"]

        onActivated:
            mycanvas.requestPaint()
    }
}
