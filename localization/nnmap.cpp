#include "nnmap.h"

using namespace std;
using namespace cv;

namespace hitcrt{

    void Nmap::creatennmap(bool showflag) {
        int width = map.cols;
        int height = map.rows;
        Rect rect(expand_x,expand_y,width,height);
        map.copyTo(nmap(rect));
        Mat temp = cv::Mat(map.rows+2*expand_y,map.cols+2*expand_x,CV_32FC1);

        if (showflag)
            show();

        // use flann calc pixels nndist
        vector<Point2f > black;
        vector<Point2f > white;
        for (int i=0;i < nmap.rows;i++){
            for (int j=0;j < nmap.cols;j++){
                if (nmap.ptr<uchar >(i)[j] == 255)
                    white.emplace_back(Point2f(j,i));
                if (nmap.ptr<uchar >(i)[j] == 0)
                    black.emplace_back(Point2f(j,i));
            }
        }

        Mat sourceblack = cv::Mat(black).reshape(1);
        Mat sourcewhite = cv::Mat(white).reshape(1);
        sourceblack.convertTo(sourceblack,CV_32F);
        sourcewhite.convertTo(sourcewhite,CV_32F);
        flann::KDTreeIndexParams indexParams(4);
        flann::Index kdtreeblack(sourceblack, indexParams);
        flann::Index kdtreewhite(sourcewhite, indexParams);
        unsigned int k = 2; //number of nearest neighbors
        vector<int> indices(k);
        vector<float> dists(k);
        flann::SearchParams params(512);


        // calc nndist of white pixels
        for (const Point2f &l:white) {
            vector<float> query;
            query.push_back(l.x);
            query.push_back(l.y);
            kdtreeblack.knnSearch(query, indices, dists, k,params);
            nmap.ptr<uchar >(int(l.y))[int(l.x)] = uchar(sqrt(dists[0]));
        }

        // calc nndist of black pixels
        for (const Point2f &l:black) {
            vector<float> query;
            query.push_back(l.x);
            query.push_back(l.y);
            kdtreewhite.knnSearch(query, indices, dists, k,params);
            nmap.ptr<uchar >(int(l.y))[int(l.x)] = uchar(sqrt(dists[0]));
        }
    }

    Mat Nmap::getnmap() {
        return nmap;
    }

    void Nmap::show() {
        while (waitKey(20) != 27){
            imshow("nmap",nmap);
        }
    }
}
