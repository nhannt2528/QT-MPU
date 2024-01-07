import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11
import QtQuick.Controls 1.4
import QtQml 2.14

Item {
    property int do_cao: 0
      property int goc_quay: 0
    id:root
    width: 400
    height: 500
    clip: true
    Connections{
        target: my_mpu
        function onDoCaoChanged(){
            do_cao=my_mpu.doCao;
//            console.log(do_cao)
//            idAngle.setAngle=my_mpu.angleZ
        }
        function onGocNghiengChanged(){
            goc_quay=my_mpu.gocNghieng;
//              console.log(goc_quay)
        }
    }
//    Timer{
//        id:m_timer
//        interval: 500
//        repeat: true
//        running: true
//        onTriggered: {
//            do_cao=getRandomNumber(-90,90);
//            goc_quay=getRandomNumber(-45,45);
//        }
//    }
    function getRandomNumber(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }
    Rectangle{
        width: 200
        height: 200
        color: "#070000ff"
        //        color: "blue"
        anchors.centerIn: parent
        clip: true
        Image {
            id: g_1_do_cao
            source: "qrc:/images/h1.png"
            fillMode: Image.PreserveAspectFit
            width: g_3_atitude_direction.width/3
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: -242+do_cao-51
        }
    }
    Image {
        id: g_3_atitude_direction
        source: "qrc:/images/ADI_2.png"
        fillMode: Image.PreserveAspectFit
        height: root.height
        anchors.fill: parent
        Image {
            id: g_1_atitude_direction
            source: "qrc:/images/g_1.png"
            fillMode: Image.PreserveAspectFit
            width: g_3_atitude_direction.width-(g_3_atitude_direction.width*0.1887175324675325*2)
            anchors.horizontalCenter: g_3_atitude_direction.horizontalCenter
            anchors.top: g_3_atitude_direction.top
            anchors.topMargin: g_3_atitude_direction.height*0.456
            transformOrigin: root.Center
            rotation: goc_quay
        }
    }
}
