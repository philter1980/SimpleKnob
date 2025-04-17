import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    id: cover
    property int currentValue: 50  // valore da aggiornare da FirstPage o main

    // Etichetta del valore
    Label {
        id: valueLabel
        anchors.centerIn: parent
        font.pixelSize: Theme.fontSizeExtraLarge
        color: "white"
        text: currentValue
    }

    // Azioni sulla cover
    CoverActionList {
        id: coverAction

        CoverAction {
            iconSource: "image://theme/icon-cover-next"
            onTriggered: {
                // Esempio: aumenta valore
                if (cover.currentValue < 100)
                    cover.currentValue += 5
            }
        }

        CoverAction {
            iconSource: "image://theme/icon-cover-pause"
            onTriggered: {
                // Esempio: resetta valore
                cover.currentValue = 0
            }
        }
    }
}
