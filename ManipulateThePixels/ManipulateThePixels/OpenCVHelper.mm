//
//  OpenCVHelper.m
//  LoadSaveDisplayImage
//
//  Created by ShrawanKumar Sharma on 08/02/17.
//  Copyright © 2017 com.LoadSaveDisplayImage. All rights reserved.
//

#import "OpenCVHelper.h"
#import <opencv2/imgcodecs/ios.h>
#include <opencv2/highgui/highgui.hpp>
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/core.hpp"

@implementation OpenCVHelper

+(NSString *)returnOpenCVVersion {
    return [NSString stringWithFormat:@"opencv format is %s", CV_VERSION];
}


+ (UIImage*)makeGrayscale:(UIImage*)rawImage {
    cv::Mat imageMat;
    UIImageToMat(rawImage, imageMat);
    cv::Mat grayscaleMat;
    cv::cvtColor(imageMat, grayscaleMat, CV_BGR2GRAY);  
    return MatToUIImage(grayscaleMat);
}

+(UIImage *)addSlatToImage:(UIImage *)rawImage {
    cv::Mat imageMat;
    
    UIImageToMat(rawImage, imageMat);  //Convert image to Mat
    NSLog(@" col and row of the image == \n %d %d \n" , imageMat.cols , imageMat.rows);
    
    int n = 2000;
    for (int k=0; k<n; k++) {
        // rand() is the MFC random number generator
        // try qrand() with Qt
        int i= rand()%imageMat.cols;
        int j= rand()%imageMat.rows;
        if (imageMat.channels() == 1) { // gray-level image
            imageMat.at<uchar>(j,i)= 255;
        } else if (imageMat.channels() > 1 ) { // color image
            imageMat.at<cv::Vec3b>(j,i)[0]= 255;
            imageMat.at<cv::Vec3b>(j,i)[1]= 255;
            imageMat.at<cv::Vec3b>(j,i)[2]= 255;
        }
    }
    
    return MatToUIImage(imageMat);
}

+(UIImage *)addSlatToImageByPointer:(UIImage *)rawImage {
    
    //We will illustrate the image scanning process by accomplishing a simple task: reducing the
    //number of colors in an image.
    cv::Mat imageMat;
    return MatToUIImage(imageMat);
}

/*
 
  cv::addWeighted(image1,0.7,image2,0.9,0.,result);
 // c[i]= a[i]+b[i];
 cv::add(imageA,imageB,resultC);
 // c[i]= a[i]+k;
 cv::add(imageA,cv::Scalar(k),resultC);
 // c[i]= k1*a[1]+k2*b[i]+k3;
 cv::addWeighted(imageA,k1,imageB,k2,k3,resultC);
 // c[i]= k*a[1]+b[i];
 cv::scaleAdd(imageA,k,imageB,resultC);
 For some functions, you can also specify a mask:
 // if (mask[i]) c[i]= a[i]+b[i];
 cv::add(imageA,imageB,resultC,mask
 
 But function cv::add requires two images of same size. In this case, a region of interest
 (ROI) can be defined over which the cv::add can be applied. This will work as long as the ROI
 is of same size as our logo image. The position of the ROI will determined where in the image
 the logo will be inserted.
 
 
 The first step consists of defining the ROI. Once defined, the ROI can be manipulated as
 a regular cv::Mat instance. The key is that the ROI points to the same data buffer as its
 parent image. Inserting the logo would then be accomplished as follows:
 // define image ROI
 cv::Mat imageROI;
 imageROI= image(cv::Rect(385,270,logo.cols,logo.rows));
 // add logo to image
 cv::addWeighted(imageROI,1.0,logo,0.3,0.,imageROI);
 
 Copy by the mask
 // define ROI
 imageROI= image(cv::Rect(385,270,logo.cols,logo.rows));
 // load the mask (must be gray-level)
 cv::Mat mask= cv::imread("logo.bmp",0);
 // copy to ROI with mask
 logo.copyTo(imageROI,mask);
 */


@end
