//
//  UIImage+HGExtention.h
//  BabysCard_OC
//
//  Created by 小雨很美 on 2017/6/19.
//  Copyright © 2017年 小雨很美. All rights reserved.
//

#import <UIKit/UIKit.h>
//使用 PHAsset 需要引入Photos Framework，支持 iOS8.0 及以上版本。
#import <Photos/Photos.h>

@interface UIImage (HGExtention)
- (NSData *)dataForUpload;
+ (UIImage *)fullScreenImagePHAsset:(PHAsset *)asset;
@end
