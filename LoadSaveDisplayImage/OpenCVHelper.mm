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


@end
