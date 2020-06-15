import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4


Item {
    id: mainItem

    property int shapeSize: 400
//    Rectangle {
//        id:mainRect
//        //color: "red"
//        width: parent.width
//        height: parent.height
//        radius: width
//        anchors.verticalCenter: parent.verticalCenter
//        anchors.horizontalCenter: parent.horizontalCenter
        Dial {
            id:diall
            width: parent.width
            height: parent.height
            stepSize: 1
            minimumValue: 8
            maximumValue: 35
            value: 20
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            onValueChanged: {
                if(diall.value < 10)
                {
                    dialValue.color = "red"
                }
                else if(diall.value > 10 && diall.value < 25)
                {
                    dialValue.color = "green"
                }
                else if(diall.value >= 25)
                {
                    dialValue.color = "red"
                }
                dialValue.text = Math.round(diall.value)
            } // end of onValueChanged:
            tickmarksVisible: true;
            style: DialStyle {
                id:dialStylee
                tickmarkStepSize: 1
                tickmarkInset: 27.0

                tickmark: Item {
                    height: 20
                    width: 20
                    Text {
                        //text: Math.round(diall.value)
                        text: styleData.value
                        font.pixelSize: 12
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
             }
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
    //}


}

