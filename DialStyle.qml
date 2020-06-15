import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Private 1.0

Style {
    property Component panel: StyleItem {
        id: styleItem

        property real visualPos: control.maximumValue - control.value

        property real granularity: {
            if ( ( control.maximumValue - control.minimumValue ) < 10 )
                return 100;
            else if ( ( control.maximumValue - control.minimumValue ) > 1000 )
                return 1 / Math.ceil( ( control.maximumValue - control.minimumValue ) / 1000 );
            else
                return Math.floor( 1000 / ( control.maximumValue - control.minimumValue ) );
        }

        elementType: "dial"
        activeControl: control.notchesVisible ? "ticks" : ""
        hasFocus: control.focus
        enabled: control.enabled
        sunken: control.pressed
        maximum: control.maximumValue * styleItem.granularity
        minimum: control.minimumValue * styleItem.granularity
        value: styleItem.visualPos * styleItem.granularity
        step: Math.ceil( control.notchSize * styleItem.granularity )

        Behavior on visualPos {
            enabled: !control.pressed
            NumberAnimation {
                duration: 300
                easing.type: Easing.OutSine
            }
        }
    }
}
