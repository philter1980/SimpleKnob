import QtQuick 2.0
import Sailfish.Silica 1.0
import QtMultimedia 5.0

Item {
    id: dial
    property int minValue: 0
    property int maxValue: 100
    property int stepSize: 1
    property int value: 50  // Valore iniziale
    property real angle: 180  // Angolo iniziale
	property string filePath: ""  // il file in cui salvare il valore

    width: 250
    height: 250



    Canvas {
        id: canvas
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d");
            ctx.clearRect(0, 0, width, height);

            // Disegna l'anello
            ctx.beginPath();
            ctx.arc(width / 2, height / 2, width / 2 - 10, 0, Math.PI * 2, false);
            ctx.lineWidth = 50;
            ctx.strokeStyle = "gray";
            ctx.stroke();

            // Indicatore del valore corrente
            var rad = (angle - 90) * (Math.PI / 180);
            var x = width / 2 + Math.cos(rad) * (width / 2 - 20);
            var y = height / 2 + Math.sin(rad) * (height / 2 - 20);

            ctx.beginPath();
            ctx.arc(x, y, 10, 0, Math.PI * 2, false);
            ctx.fillStyle = "red";
            ctx.fill();
        }
    }

    Component.onCompleted: console.log("Dial loaded")

    MouseArea {
        id: touchArea
        anchors.fill: parent
        onPositionChanged: function(mouse) {
            var dx = mouse.x - width / 2;
            var dy = mouse.y - height / 2;
            var newAngle = Math.atan2(dy, dx) * (180 / Math.PI) + 90;
            if (newAngle < 0)
                newAngle += 360;

            var newValue = Math.round((newAngle / 360) * (maxValue - minValue)) + minValue;
            if (newValue !== value) {
                value = newValue;
                angle = newAngle;
                canvas.requestPaint();
                }
            }

        }
		onValueChanged: {
				if (filePath.length > 0) {
					 var cmd = "sh -c \"echo " + value + " > '" + filePath + "'\""
				Qt.openUrlExternally("file://" + cmd)
				console.log("Dial value written to:", filePath)
				}
			}
			
    Label {
        anchors.centerIn: parent
        text: value
        font.pixelSize: 40
        color: "white"
    }
}
