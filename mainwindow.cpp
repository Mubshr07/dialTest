#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QStyleFactory>
#include "qdebug.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    //qDebug()<<QStyleFactory::keys();
    ui->dial->setStyle(QStyleFactory::create("windows"));
    ui->dial->setMouseTracking(false);

//    QWidget *blocker = new QWidget(this->ui->groupBox);
//    //blocker->setStyleSheet(QString::fromUtf8("background-color: rgb(61,61, 61,100);")); //just to see it
//    blocker->setStyleSheet(QString("background-color: rgba(161, 61, 61, 150);")); //just to see it
//    blocker->resize( width(), height()/1.5);
//    blocker->show();


    ui->quickWidget->setClearColor(QColor(0, 0, 255, 1));
    ui->quickWidget_2->setClearColor(QColor(0, 0, 255, 1));
    ui->quickWidget_3->setClearColor(QColor(0, 0, 255, 1));
    ui->quickWidget_4->setClearColor(QColor(0, 0, 255, 1));

}

MainWindow::~MainWindow()
{
    delete ui;
}

