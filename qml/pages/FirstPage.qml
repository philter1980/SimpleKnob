import QtQuick 2.0
import Sailfish.Silica 1.0
import Qt.labs.settings 1.0

Page {
    id: firstPage

    // Lista dei dialer letti da JSON
    property var dialers: []
    property int currentIndex: 0

    // Carica i dialer al caricamento della pagina
    Component.onCompleted: {
        loadDialers()
		// Salvare automaticamente quando i dialer sono cambiati
        firstPage.dialersChanged.connect(saveDialers)
    }

    // Impostazioni per il salvataggio
    Settings {
        id: settings
        property string dialersFilePath: "file:///home/defaultuser/.local/share/harbour-SimpleKnob/dialers.json"
    }

    function loadDialers() {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                try {
                    firstPage.dialers = JSON.parse(xhr.responseText)
                } catch (e) {
                    console.log("Error loading dialers:", e)
                }
            }
        }
        xhr.open("GET", settings.dialersFilePath, true);
        xhr.send();
    }

    function saveDialers() {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                console.log("Dialers saved successfully!")
            }
        }
        xhr.open("POST", settings.dialersFilePath, true);
        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.send(JSON.stringify(firstPage.dialers));
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: parent.height + Theme.itemSizeLarge

        PullDownMenu {
            MenuItem {
                text: "Aggiungi Dialer"
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("AddDialerPage.qml"))
                }
            }

            MenuItem {
                text: "Seleziona Dialer"
                onClicked: {
                    // Qui puoi navigare per selezionare il dialer
                }
            }
        }

        SwipeView {
            id: dialerSwipe
            anchors.fill: parent
            currentIndex: firstPage.currentIndex

            Repeater {
                model: firstPage.dialers

                Dial {
                    id: dynamicDial
                    filePath: modelData.filePath
                    value: 50
                }
				}
			}
		}
	}
}
