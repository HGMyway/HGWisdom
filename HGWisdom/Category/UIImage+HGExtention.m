//
//  UIImage+HGExtention.m
//  BabysCard_OC
//
//  Created by 小雨很美 on 2017/6/19.
//  Copyright © 2017年 小雨很美. All rights reserved.
//

#import "UIImage+HGExtention.h"

@implementation UIImage (HGExtention)
- (NSData *)dataSmallerThan:(NSUInteger)dataLength{
    CGFloat compressionQuality = 1.0;
    NSData *data = UIImageJPEGRepresentation(self, compressionQuality);
    while (data.length > dataLength) {
        CGFloat mSize = data.length / (1024 * 1000.0);
        compressionQuality *= pow(0.7, log(mSize)/ log(3));//大概每压缩 0.7，mSize 会缩小为原来的三分之一
        data = UIImageJPEGRepresentation(self, compressionQuality);
    }
    return data;
}
- (NSData *)dataForUpload{
    return [self dataSmallerThan:1024 * 1000];
}

+ (UIImage *)fullScreenImagePHAsset:(PHAsset *)asset{

    __block UIImage *image;
//    PHAssetResource *resource = [[PHAssetResource assetResourcesForAsset:asset] firstObject];



    if (asset.mediaType == PHAssetMediaTypeImage) {
        PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
        options.version = PHImageRequestOptionsVersionCurrent;
        options.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
        options.synchronous = YES;
        [[PHImageManager defaultManager] requestImageDataForAsset:asset
                                                          options:options
                                                    resultHandler:
         ^(NSData *imageData,
           NSString *dataUTI,
           UIImageOrientation orientation,
           NSDictionary *info) {
           image =  [UIImage imageWithData:imageData];
         }];
    }

//    resource.originalFilename
    return image;

}
@end
