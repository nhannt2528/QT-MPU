#include "mpu6050serial.h"

void MPU6050Serial::updateModbus()
{
    uint16_t data_reg[20]={0};
    my_modbus.readHoldingRegister(1,0,20,data_reg);
    int16_t angleZ;
    int16_t do_cao_ne;
    int16_t goc_nghieng_ne;
    angleZ=static_cast<uint16_t>(data_reg[14]);
    do_cao_ne=static_cast<uint16_t>(data_reg[8]);
    goc_nghieng_ne=static_cast<uint16_t>(data_reg[7]);
    angleZ=angleZ%360;
    if(angleZ<0){
        angleZ=360-abs(angleZ);
    }
    setAngleZ(angleZ);
    setDoCao(do_cao_ne);
    setGocNghieng(goc_nghieng_ne);
//    qDebug()<<"docao: "<<do_cao_ne;
}

MPU6050Serial::MPU6050Serial(QObject *parent)
    : QObject{parent}
{
    timer=new QTimer(this);
    connect(timer,&QTimer::timeout,this,&MPU6050Serial::updateModbus);
    timer->setInterval(5000);
}
void MPU6050Serial::begin()
{
    if(  my_modbus.connectDevice()){
        timer->stop();
        timer->setInterval(50);
    }
    timer->start();
}

int MPU6050Serial::getGocNghieng() const
{
    return gocNghieng;
}

void MPU6050Serial::setGocNghieng(int newGocNghieng)
{
    if (gocNghieng == newGocNghieng)
        return;
    gocNghieng = newGocNghieng;
    emit gocNghiengChanged();
}

int MPU6050Serial::getDoCao() const
{
    return doCao;
}

void MPU6050Serial::setDoCao(int newDoCao)
{
    if (doCao == newDoCao)
        return;
    doCao = newDoCao;
    emit doCaoChanged();
}

int MPU6050Serial::getAngleZ() const
{
    return angleZ;
}

void MPU6050Serial::setAngleZ(int newAngleZ)
{
    if (angleZ == newAngleZ)
        return;
    angleZ = newAngleZ;
    emit angleZChanged();
}

