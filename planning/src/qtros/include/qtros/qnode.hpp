/**
 * @file /include/qtros/qnode.hpp
 *
 * @brief Communications central!
 *
 * @date February 2011
 **/
/*****************************************************************************
** Ifdefs
*****************************************************************************/

#ifndef qtros_QNODE_HPP_
#define qtros_QNODE_HPP_

/*****************************************************************************
** Includes
*****************************************************************************/

// To workaround boost/qt4 problems that won't be bugfixed. Refer to
//    https://bugreports.qt.io/browse/QTBUG-22829
#ifndef Q_MOC_RUN
#include <ros/ros.h>
#endif
#include <string>
#include <QThread>
#include <QStringListModel>
#include <std_msgs/String.h>

#include <image_transport/image_transport.h>
#include "cv_bridge/cv_bridge.h"
#include "sensor_msgs/image_encodings.h"
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include "geometry_msgs/Twist.h"
/*****************************************************************************
** Namespaces
*****************************************************************************/

namespace qtros {

/*****************************************************************************
** Class
*****************************************************************************/

class QNode : public QThread {
    Q_OBJECT
public:
	QNode(int argc, char** argv );
	virtual ~QNode();
	bool init();
	bool init(const std::string &master_url, const std::string &host_url);
	void run();

	/*********************
	** Logging
	**********************/
	enum LogLevel {
	         Debug,
	         Info,
	         Warn,
	         Error,
	         Fatal
	 };

	QStringListModel* loggingModel() { return &logging_model; }
	void log( const LogLevel &level, const std::string &msg);
  QStringListModel* loggingModel_sub() { return &logging_model_sub; }
  void log_sub( const LogLevel &level, const std::string &msg);
  void Callback(const std_msgs::StringConstPtr &submsg);
  void sent_cmd();
  void send_goal(int x, int y);
  void myCallback_img(const sensor_msgs::ImageConstPtr& msg);
  void odomCallback(const geometry_msgs::Twist::ConstPtr& odom);
  cv::Mat img;//发送的图片type
Q_SIGNALS:
	void loggingUpdated();
  void rosShutdown();
  void loggingUpdated_sub();
  void imageSignal(cv::Mat);//定义发送图片的信号
  void odomSignal(float x, float y);
private:
	int init_argc;
	char** init_argv;
	ros::Publisher chatter_publisher;
  QStringListModel logging_model;
  ros::Subscriber chatter_subscriber;
  QStringListModel logging_model_sub;
  image_transport::Subscriber image_sub;
  ros::Publisher goal_publisher;
  ros::Subscriber odom_subscriber;
};

}  // namespace qtros

#endif /* qtros_QNODE_HPP_ */
