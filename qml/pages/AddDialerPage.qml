import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: addPage

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: parent.height + Theme.itemSizeLarge

        Column {
            id: column
            width: parent.width
            spacing: Theme.paddingLarge
            anchors.top: parent.top
            anchors.topMargin: Theme.paddingLarge

            TextField {
                id: pathInput
                placeholderText: "home/defaultuser/.local/share/applications/harbour-SimpleKnob/dialers.json"
            }

            Button {
                text: "Aggiungi Dialer"
                onClicked: {
                    if (pathInput.text.length > 0) {
                        // Aggiungi il dialer alla lista
                        firstPage.dialers.push({
                            filePath: pathInput.text
                        })
                        firstPage.saveDialers()  // Salva la lista aggiornata
                        pageStack.pop()  // Torna alla pagina principale
                    }
                }
            }
        }
    }
}
