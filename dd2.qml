import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4


Item {
    id: mainItem
    Rectangle {
        id:mainRect
        color: "transparent"
        width: parent.width
        height: parent.height
        radius: width
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        Dial {
            id:diall
            width: parent.width
            height: parent.height
            minimumValue: 0
            maximumValue: 100
            value: 20
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            onValueChanged: {
                if(diall.value < 10)
                {
                    //diall.palette.dark = "red"
                    dialValue.color = "red"
                }
                else if(diall.value > 10 && diall.value < 70)
                {
                    //diall.palette.dark= "green"
                    dialValue.color = "green"
                }
                else if(diall.value >= 70)
                {
                    //diall.palette.dark = "red"
                    dialValue.color = "red"
                }
                dialValue.text = Math.round(diall.value)
            } // end of onValueChanged:

            style: DialStyle {
                tickmarkInset: 2.2
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
    }

}



