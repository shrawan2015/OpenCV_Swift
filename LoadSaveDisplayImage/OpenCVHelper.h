//
//  OpenCVHelper.h
//  LoadSaveDisplayImage
//
//  Created by ShrawanKumar Sharma on 08/02/17.
//  Copyright © 2017 com.LoadSaveDisplayImage. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>


@interface OpenCVHelper : NSObject
+(NSString *)returnOpenCVVersion ;
+ (UIImage*)makeGrayscale:(UIImage*)rawImage;
@end
