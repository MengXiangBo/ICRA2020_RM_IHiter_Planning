/**
 * @file /src/qnode.cpp
 *
 * @brief Ros communication central!
 *
 * @date February 2011
 **/

/*****************************************************************************
** Includes
*****************************************************************************/

#include <ros/ros.h>
#include <ros/network.h>
#include <string>
#include <std_msgs/String.h>
#include <sstream>
#include "../include/qtros/qnode.hpp"

/*****************************************************************************
** Namespaces
*****************************************************************************/
namespace enc = sensor_msgs::image_encodings;
namespace qtros {

/*****************************************************************************
** Implementation
*****************************************************************************/

QNode::QNode(int argc, char** argv ) :
	init_argc(argc),
	init_argv(argv)
	{}

QNode::~QNode() {
    if(ros::isStarted()) {
      ros::shutdown(); // explicitly needed since we use ros::start();
      ros::waitForShutdown();
    }
	wait();
}

bool QNode::init() {
	ros::init(init_argc,init_argv,"qtros");
	if ( ! ros::master::check() ) {
		return false;
	}
	ros::start(); // explicitly needed since our nodehandle is going out of scope.
	ros::NodeHandle n;
	// Add your ros communications here.
	chatter_publisher = n.advertise<std_msgs::String>("chatter", 1000);
  chatter_subscriber = n.subscribe("chatter", 1000, &QNode::Callback, this);
  goal_publisher = n.advertise<geometry_msgs::Twist>("goal", 1);
  odom_subscriber = n.subscribe("lidar_odom", 1, &QNode::odomCallback, this);
  image_transport::ImageTransport it(n);
  image_sub = it.subscribe("camera/image", 1, &QNode::myCallback_img, this);
	start();
	return true;
}

bool QNode::init(const std::string &master_url, const std::string &host_url) {
	std::map<std::string,std::string> remappings;
	remappings["__master"] = master_url;
	remappings["__hostname"] = host_url;
	ros::init(remappings,"qtros");
	if ( ! ros::master::check() ) {
		return false;
	}
	ros::start(); // explicitly needed since our nodehandle is going out of scope.
	ros::NodeHandle n;
	// Add your ros communications here.
	chatter_publisher = n.advertise<std_msgs::String>("chatter", 1000);
  chatter_subscriber = n.subscribe("chatter", 1000, &QNode::Callback, this);
  goal_publisher = n.advertise<geometry_msgs::Twist>("goal", 1);
  odom_subscriber = n.subscribe("lidar_odom", 1, &QNode::odomCallback, this);
  image_transport::ImageTransport it(n);
  image_sub = it.subscribe("camera/image",1,&QNode::myCallback_img,this);
	start();
	return true;
}

void QNode::run() {
  ros::Rate loop_rate(1000);
	int count = 0;
	while ( ros::ok() ) {

    //std_msgs::String msg;
    //std::stringstream ss;
    //ss << "hello world " << count;
    //msg.data = ss.str();
    //chatter_publisher.publish(msg);
    //log(Info,std::string("I sent: ")+msg.data);
		ros::spinOnce();
		loop_rate.sleep();
		++count;
	}
	std::cout << "Ros shutdown, proceeding to close the gui." << std::endl;
	Q_EMIT rosShutdown(); // used to signal the gui for a shutdown (useful to roslaunch)
}


void QNode::log( const LogLevel &level, const std::string &msg) {
	logging_model.insertRows(logging_model.rowCount(),1);
	std::stringstream logging_model_msg;
	switch ( level ) {
		case(Debug) : {
				ROS_DEBUG_STREAM(msg);
				logging_model_msg << "[DEBUG] [" << ros::Time::now() << "]: " << msg;
				break;
		}
		case(Info) : {
				ROS_INFO_STREAM(msg);
				logging_model_msg << "[INFO] [" << ros::Time::now() << "]: " << msg;
				break;
		}
		case(Warn) : {
				ROS_WARN_STREAM(msg);
				logging_model_msg << "[INFO] [" << ros::Time::now() << "]: " << msg;
				break;
		}
		case(Error) : {
				ROS_ERROR_STREAM(msg);
				logging_model_msg << "[ERROR] [" << ros::Time::now() << "]: " << msg;
				break;
		}
		case(Fatal) : {
				ROS_FATAL_STREAM(msg);
				logging_model_msg << "[FATAL] [" << ros::Time::now() << "]: " << msg;
				break;
		}
	}
	QVariant new_row(QString(logging_model_msg.str().c_str()));
	logging_model.setData(logging_model.index(logging_model.rowCount()-1),new_row);
	Q_EMIT loggingUpdated(); // used to readjust the scrollbar
}
void QNode::log_sub( const LogLevel &level, const std::string &msg)
{
  logging_model_sub.insertRows(logging_model_sub.rowCount(),1);
  std::stringstream logging_model_msg;
  switch ( level ) {
    case(Debug) : {
        ROS_DEBUG_STREAM(msg);
        logging_model_msg << "[DEBUG] [" << ros::Time::now() << "]: " << msg;
        break;
    }
    case(Info) : {
        ROS_INFO_STREAM(msg);
        logging_model_msg << "[INFO] [" << ros::Time::now() << "]: " << msg;
        break;
    }
    case(Warn) : {
        ROS_WARN_STREAM(msg);
        logging_model_msg << "[INFO] [" << ros::Time::now() << "]: " << msg;
        break;
    }
    case(Error) : {
        ROS_ERROR_STREAM(msg);
        logging_model_msg << "[ERROR] [" << ros::Time::now() << "]: " << msg;
        break;
    }
    case(Fatal) : {
        ROS_FATAL_STREAM(msg);
        logging_model_msg << "[FATAL] [" << ros::Time::now() << "]: " << msg;
        break;
    }
  }
  QVariant new_row(QString(logging_model_msg.str().c_str()));
 logging_model_sub.setData(logging_model_sub.index(logging_model_sub.rowCount()-1),new_row);
  Q_EMIT loggingUpdated_sub(); // used to readjust the scrollbar
}

void QNode::Callback(const std_msgs::StringConstPtr &submsg)
{
  log_sub(Info, std::string("Success sub:")+submsg->data.c_str());
}

void QNode::myCallback_img(const sensor_msgs::ImageConstPtr &msg)
{
  cv_bridge::CvImagePtr cv_ptr;
  try
  {
    cv_ptr = cv_bridge::toCvCopy(msg, enc::BGR8);
    //cv::imshow("gui_subscriber listener from node_a",cv_ptr->image);
    img = cv_ptr->image;//呼应public中的img 啊！
    Q_EMIT imageSignal(img);  //将信号发出去
    //cv::waitKey(30);
  }
  catch (cv_bridge::Exception& e)
  {
    ROS_ERROR("cv_bridge exception: %s", e.what());
    return;
  }

}

void QNode::odomCallback(const geometry_msgs::Twist::ConstPtr& odom)
{
  Q_EMIT odomSignal(odom->linear.x, odom->linear.y);  //将信号发出去
}

void QNode::sent_cmd()
{
  if(ros::ok())
  {
    std_msgs::String msg;
    std::stringstream ss;
    ss << "Refreshed!";
    msg.data = ss.str();
    chatter_publisher.publish(msg);
    log(Info, std::string(msg.data));
    ros::spinOnce();
  }
}
void QNode::send_goal(int x, int y)
{
  if(ros::ok())
  {
    geometry_msgs::Twist twist;
    twist.linear.x = float(x)/100;
    twist.linear.y = float(448-y)/100;
    goal_publisher.publish(twist);
  }
}

}  // namespace qtros

