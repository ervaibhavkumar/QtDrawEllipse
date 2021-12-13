import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Draw Ellipse")

    Canvas {
        id: canvas
        anchors.fill: parent
        property int drawX: parent.width / 2
        property int drawY: parent.height / 2
        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true

            onPositionChanged: {
                canvas.drawX = mouse.x
                canvas.drawY = mouse.y;
                canvas.requestPaint()
            }
        }
        onPaint: {
            var ctx = canvas.getContext("2d");
            ctx.save();
            ctx.beginPath();
            ctx.lineWidth = 2;
            ctx.fillStyle = Qt.rgba(Math.random(),Math.random(),Math.random(),1);

            var size = Math.random() * 20 + 3;
            ctx.ellipse(canvas.drawX, canvas.drawY, size, size);
            ctx.fill();
        }
    }
}
