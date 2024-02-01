import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    objectName: "defaultCover"

    CoverTemplate {
        objectName: "placeholder"

        icon {
            source: Qt.resolvedUrl("../icons/dbys.svg")
            sourceSize { width: icon.width; height: icon.height }
        }

    }
}
