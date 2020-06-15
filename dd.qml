import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.2

Item {
    id: page

     Dial {
        id:diall

        width: parent.width
        height: parent.height

        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        from:0
        to:100
        value: 30

        handle: Rectangle{
            id: handleItem
            x: diall.background.x + diall.background.width / 2 - width / 2
            y: diall.background.y + diall.background.height / 2 - height / 2
            width: 30
            height: 30
            color:"transparent"
            transform: [
                Translate {
                    y: -Math.min(diall.background.width, diall.background.height) * 0.4 + handleItem.height / 2
                },
                Rotation {
                    angle: diall.angle
                    origin.x: handleItem.width / 2
                    origin.y: handleItem.height / 2
                }
            ]
            Canvas{
                anchors.fill:parent
                onPaint:{
                    var context = getContext("2d");
                    // the triangle
                    context.beginPath();
                    context.moveTo(0, handleItem.width/2);
                    context.lineTo(handleItem.width/2, handleItem.width);
                    context.lineTo(handleItem.width, 0);
                    context.closePath();
                    // the fill color
                    context.fillStyle = "#FFCC00";
                    context.fill();
                }
                //rotation: 315
                rotation: -45
            }


        }



        //            handle: Rectangle {
        //                    id: handleItem
        //                    x: diall.background.x + diall.background.width / 2 - width / 2
        //                    y: diall.background.y + diall.background.height / 2 - height / 2
        //                    width: 16
        //                    height: 16
        //                    color: diall.pressed ? "#17a81a" : "#21be2b"
        //                    radius: 8
        //                    antialiasing: true
        //                    opacity: diall.enabled ? 1 : 0.3
        //                    transform: [
        //                        Translate {
        //                            y: -Math.min(diall.background.width, diall.background.height) * 0.4 + handleItem.height / 2
        //                        },
        //                        Rotation {
        //                            angle: diall.angle
        //                            origin.x: handleItem.width / 2
        //                            origin.y: handleItem.height / 2
        //                        }
        //                    ]
        //                }

        onValueChanged: {
            if(diall.value < 10)
            {
                diall.palette.dark = "red"
                dialValue.color = "red"
            }
            else if(diall.value > 10 && diall.value < 70)
            {
                diall.palette.dark= "green"
                dialValue.color = "green"
            }
            else if(diall.value >= 70)
            {
                diall.palette.dark = "red"
                dialValue.color = "red"
            }
            dialValue.text = Math.round(diall.value)
        } // end of onValueChanged:


    }

    Label
    {
        id:dialValue
        text: diall.value
        color: "black"
        font.pointSize: 45
        font.bold: true

        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }


}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
