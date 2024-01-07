#ifndef MPU6050SERIAL_H
#define MPU6050SERIAL_H

#include <QObject>
#include <QSerialPort>
#include <QSerialPortInfo>
#include <QDebug>
#include <QTimer>
#include <ModbusRtuMaster/modbusrtumaster.h>
class MPU6050Serial : public QObject
{
    Q_OBJECT
private:
    ModbusRtuMaster my_modbus;
    QTimer *timer;
    Q_PROPERTY(int angleZ READ getAngleZ WRITE setAngleZ NOTIFY angleZChanged FINAL)
    Q_PROPERTY(int doCao READ getDoCao WRITE setDoCao NOTIFY doCaoChanged FINAL)

    Q_PROPERTY(int gocNghieng READ getGocNghieng WRITE setGocNghieng NOTIFY gocNghiengChanged FINAL)

private slots:
    void updateModbus();
public:
    explicit MPU6050Serial(QObject *parent = nullptr);
    void begin();
    void readFromModbus();
    int angleZ=0;
    int doCao=0;
    int gocNghieng=0;

    int getAngleZ() const;
    void setAngleZ(int newAngleZ);

    int getDoCao() const;
    void setDoCao(int newDoCao);

    int getGocNghieng() const;
    void setGocNghieng(int newGocNghieng);

signals:

    void angleZChanged();
    void doCaoChanged();
    void gocNghiengChanged();
};

#endif // MPU6050SERIAL_H
