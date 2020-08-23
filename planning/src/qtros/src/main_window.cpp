/**
 * @file /src/main_window.cpp
 *
 * @brief Implementation for the qt gui.
 *
 * @date February 2011
 **/
/*****************************************************************************
** Includes
*****************************************************************************/

#include <QtGui>
#include <QMessageBox>
#include <iostream>
#include "../include/qtros/main_window.hpp"

/*****************************************************************************
** Namespaces
*****************************************************************************/

namespace qtros {

using namespace Qt;

/*****************************************************************************
** Implementation [MainWindow]
*****************************************************************************/

MainWindow::MainWindow(int argc, char** argv, QWidget *parent)
	: QMainWindow(parent)
	, qnode(argc,argv)
{
  qRegisterMetaType<cv::Mat>("cv::Mat");
	ui.setupUi(this); // Calling this incidentally connects all ui's triggers to on_...() callbacks in this class.

  ui.label_4->installEventFilter(this);//安装事件过滤器
  ui.label_4->adjustSize();
  ui.label_4->setScaledContents(true); //默认是false

  QObject::connect(ui.actionAbout_Qt, SIGNAL(triggered(bool)), qApp, SLOT(aboutQt())); // qApp is a global variable for the application

  ReadSettings();
	setWindowIcon(QIcon(":/images/icon.png"));
	ui.tab_manager->setCurrentIndex(0); // ensure the first tab is showing - qt-designer should have this already hardwired, but often loses it (settings?).
  QObject::connect(&qnode, SIGNAL(rosShutdown()), this, SLOT(close()));

	/*********************
	** Logging
	**********************/
	ui.view_logging->setModel(qnode.loggingModel());
  QObject::connect(&qnode, SIGNAL(loggingUpdated()), this, SLOT(updateLoggingView()));

  //ui.view_logging_sub->setModel(qnode.loggingModel_sub());
  //QObject::connect(&qnode, SIGNAL(loggingUpdated_sub()), this, SLOT(updateLoggingView_sub()));
  QObject::connect(ui.sent_cmd, SIGNAL(clicked()), this, SLOT(pub_cmd()));
  QObject::connect(&qnode, SIGNAL(imageSignal(cv::Mat)), this, SLOT(displayMat(cv::Mat)));
  QObject::connect(&qnode, SIGNAL(odomSignal(float, float)), this, SLOT(displayodom(float, float)));
  /*********************
  ** Auto Start
  **********************/
  if ( ui.checkbox_remember_settings->isChecked() ) {
      on_button_connect_clicked(true);
    }
}

MainWindow::~MainWindow() {}


bool MainWindow::eventFilter(QObject *obj, QEvent *event)
{
    if (obj == ui.label_4)//指定某个QLabel
    {
        if (event->type() == QEvent::MouseButtonRelease)//mouse button pressed
        {
            QMouseEvent *mouseEvent = static_cast<QMouseEvent*>(event);
            if(mouseEvent->button() == Qt::LeftButton)
            {
                //QString str;
                //str = QString("%1 , %2").arg(mouseEvent->pos().x()).arg(mouseEvent->pos().y());
                //ui.label_4->setText(str);
                //QMessageBox::information(NULL,"点击", str,
                //                         QMessageBox::Yes|QMessageBox::No,QMessageBox::Yes);

                qnode.send_goal(mouseEvent->pos().x(), mouseEvent->pos().y());
                return true;
            }
            else
            {
                return false;
            }
        }
        else
        {
            return false;
        }
    }
    else
    {
        // pass the event on to the parent class
        return QMainWindow::eventFilter(obj, event);
    }
}

/*****************************************************************************
** Implementation [Slots]
*****************************************************************************/

void MainWindow::showNoMasterMessage() {
	QMessageBox msgBox;
	msgBox.setText("Couldn't find the ros master.");
	msgBox.exec();
    close();
}

/*
 * These triggers whenever the button is clicked, regardless of whether it
 * is already checked or not.
 */

void MainWindow::on_button_connect_clicked(bool check ) {
	if ( ui.checkbox_use_environment->isChecked() ) {
		if ( !qnode.init() ) {
			showNoMasterMessage();
		} else {
			ui.button_connect->setEnabled(false);
		}
	} else {
		if ( ! qnode.init(ui.line_edit_master->text().toStdString(),
				   ui.line_edit_host->text().toStdString()) ) {
			showNoMasterMessage();
		} else {
			ui.button_connect->setEnabled(false);
			ui.line_edit_master->setReadOnly(true);
			ui.line_edit_host->setReadOnly(true);
			ui.line_edit_topic->setReadOnly(true);
		}
	}
}


void MainWindow::on_checkbox_use_environment_stateChanged(int state) {
	bool enabled;
	if ( state == 0 ) {
		enabled = true;
	} else {
		enabled = false;
	}
	ui.line_edit_master->setEnabled(enabled);
	ui.line_edit_host->setEnabled(enabled);
	//ui.line_edit_topic->setEnabled(enabled);
}

/*****************************************************************************
** Implemenation [Slots][manually connected]
*****************************************************************************/

/**
 * This function is signalled by the underlying model. When the model changes,
 * this will drop the cursor down to the last line in the QListview to ensure
 * the user can always see the latest log message.
 */
void MainWindow::updateLoggingView() {
        ui.view_logging->scrollToBottom();
}
/*
void MainWindow::updateLoggingView_sub()
{
    ui.view_logging_sub->scrollToBottom();
}*/
void MainWindow::pub_cmd()
{
  qnode.sent_cmd();
  ui.label_4->setScaledContents(false); //默认是false
}
void MainWindow::displayMat(cv::Mat image)
{
  cv::Mat rgb;
  QImage img;
  if(image.channels()==3)
  {
      //cvt Mat BGR 2 QImage RGB
      cv::cvtColor(image,rgb,CV_BGR2RGB);
      img =QImage((const unsigned char*)(rgb.data),
                  rgb.cols,rgb.rows,
                  rgb.cols*rgb.channels(),
                  QImage::Format_RGB888);
  }
  else
  {
      img =QImage((const unsigned char*)(image.data),
                  image.cols,image.rows,
                  image.cols*image.channels(),
                  QImage::Format_RGB888);
  }
  ui.label_4->setPixmap(QPixmap::fromImage(img));//label_4就是你添加的label的对象名
  ui.label_4->resize(ui.label_4->pixmap()->size());
}

void MainWindow::displayodom(float x, float y)
{
  //node.sent_cmd();
  QString str;
  str = QString("%1 m").arg(x);
  ui.lineEditx->setText(str);
  str = QString("%1 m").arg(y);
  ui.lineEdity->setText(str);
}
/*****************************************************************************
** Implementation [Menu]
*****************************************************************************/

void MainWindow::on_actionAbout_triggered() {
    QMessageBox::about(this, tr("About ..."),tr("<h2>PACKAGE_NAME Test Program 0.10</h2><p>Copyright Yujin Robot</p><p>This package needs an about description.</p>"));
}

/*****************************************************************************
** Implementation [Configuration]
*****************************************************************************/

void MainWindow::ReadSettings() {
    QSettings settings("Qt-Ros Package", "qtros");
    restoreGeometry(settings.value("geometry").toByteArray());
    restoreState(settings.value("windowState").toByteArray());
    QString master_url = settings.value("master_url",QString("http://192.168.1.2:11311/")).toString();
    QString host_url = settings.value("host_url", QString("192.168.1.3")).toString();
    //QString topic_name = settings.value("topic_name", QString("/chatter")).toString();
    ui.line_edit_master->setText(master_url);
    ui.line_edit_host->setText(host_url);
    //ui.line_edit_topic->setText(topic_name);
    bool remember = settings.value("remember_settings", false).toBool();
    ui.checkbox_remember_settings->setChecked(remember);
    bool checked = settings.value("use_environment_variables", false).toBool();
    ui.checkbox_use_environment->setChecked(checked);
    if ( checked ) {
    	ui.line_edit_master->setEnabled(false);
    	ui.line_edit_host->setEnabled(false);
    	//ui.line_edit_topic->setEnabled(false);
    }
}

void MainWindow::WriteSettings() {
    QSettings settings("Qt-Ros Package", "qtros");
    settings.setValue("master_url",ui.line_edit_master->text());
    settings.setValue("host_url",ui.line_edit_host->text());
    //settings.setValue("topic_name",ui.line_edit_topic->text());
    settings.setValue("use_environment_variables",QVariant(ui.checkbox_use_environment->isChecked()));
    settings.setValue("geometry", saveGeometry());
    settings.setValue("windowState", saveState());
    settings.setValue("remember_settings",QVariant(ui.checkbox_remember_settings->isChecked()));

}

void MainWindow::closeEvent(QCloseEvent *event)
{
	WriteSettings();
	QMainWindow::closeEvent(event);
}


}  // namespace qtros

