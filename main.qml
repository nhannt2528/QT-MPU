import QtQuick 2.15
import QtQuick.Window 2.15

import "qrc:/background"
import "qrc:/gause"
import QtQuick.Controls 2.15


Window {
    //    width: Qt.desktop.screenGeometry.width
    //    height: Qt.desktop.screenGeometry.height
    property int scale_compoent: (3696-3001)/3696*100
    width: 1920
    height: 1080
    visible: true
    title: qsTr("Gyro Compass")
    visibility: Window.FullScreen
    CustomBackground{
        width: 1920
        height: 1080
    }
    ADIGause{
        id: adiGauseId
        width: 460
        height: 440
        x:372

    }
            GyroCompassGause{
                id: gyroCompassId
                width: 310
                height: width
                x:468
                y:533
            }
//    Row{
//        Slider{
//            id: x_slider_id
//            from: 0
//            to: 1920
//            onValueChanged: {
//                gyroCompassId.x=value
//                console.log("x:",value );
//            }
//            Label{
//                text: "x_slider"
//            }
//        }
//        Slider{
//            id: y_slider_id
//            from: 0
//            to: 1080
//            onValueChanged: {
//                gyroCompassId.y=value
//                console.log("y:",value );
//            }
//            Label{
//                text: "y_slider"
//            }
//        }

//    }










}
