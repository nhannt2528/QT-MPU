import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11
import QtQuick.Controls 1.4
import QtQml 2.14

Item {

    id:root
    width: 300
    height: 400
    clip: true
    Image {
        id: g_1_do_cao
        source: "qrc:/images/h1.png"
        fillMode: Image.PreserveAspectFit
        width: root.width/3
        anchors.horizontalCenter:  g_1_atitude_direction.horizontalCenter
    }

    Image {
        id: g_1_atitude_direction
        source: "qrc:/images/g_1.png"
        fillMode: Image.PreserveAspectFit
        width: g_3_atitude_direction.width-(g_3_atitude_direction.width*0.1887175324675325*2)
        anchors.top: g_3_atitude_direction.top
        anchors.topMargin: 300
        anchors.horizontalCenter:  g_3_atitude_direction.horizontalCenter

    }
    Image {

        id: g_3_atitude_direction
        source: "qrc:/images/ADI_2.png"
        fillMode: Image.PreserveAspectFit
        width: root.width
    }




}
