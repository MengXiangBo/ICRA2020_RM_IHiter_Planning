#ifndef AMCL_PCL_NNMAP_H
#define AMCL_PCL_NNMAP_H

#include <iostream>
#include <string.h>

#include <opencv2/opencv.hpp>

namespace hitcrt{

class Nmap{
public:
    Nmap(int x,int y,std::string path,bool flag=false):
    expand_x(x),expand_y(y),map_path(std::move(path)),showflag(flag){
        map = cv::imread(map_path,0);
        assert(!map.empty());
        nmap = cv::Mat(map.rows+2*expand_y,map.cols+2*expand_x,CV_8UC1,cv::Scalar::all(255));
        creatennmap(showflag);
        cv::imwrite("../map/map810x510_dist.png",nmap);
    };
    Nmap(int x,int y,bool flag=false):expand_x(x),expand_y(y),showflag(flag){
        map = cv::imread(map_path,0);
        assert(!map.empty());
        nmap = cv::Mat(map.rows+2*expand_y,map.cols+2*expand_x,CV_8UC1,cv::Scalar::all(255));
        creatennmap(showflag);
        cv::imwrite("../map/map810x510_dist.png",nmap);
    };
    ~Nmap()= default;
    std::string map_path = "../map/map810x510_gray.png";

    int expand_x = 100; // 地图x坐标的pad，保证投影来的扫描点坐标不会超出地图范围
    int expand_y = 100;  // 地图y坐标的pad，保证投影来的扫描点坐标不会超出地图范围

    bool showflag;
    cv::Mat map;

    /**
     * @brief show nmap
     */
    void show();

    /**
     * @brief return nmap
     */
    cv::Mat getnmap();

private:
    cv::Mat nmap;

    /**
     * @brief create nmap with map
     */
    void creatennmap(bool showflag);
};
}

#endif //AMCL_PCL_NNMAP_H
