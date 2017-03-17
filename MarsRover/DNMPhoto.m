//
//  DNMPhoto.m
//  MarsRover
//
//  Created by Demick McMullin on 3/7/17.
//  Copyright © 2017 Demick McMullin. All rights reserved.
//

#import "DNMPhoto.h"

@implementation DNMPhoto

- (instancetype)initWithPhotoID:(NSInteger)photoID solTaken:(NSInteger)solTaken cameraName:(NSString *)cameraName earthDate:(NSString *)earthDate imageURL:(NSString *)imageURL
{
    self = [super init];
    if (self) {
        _photoID = photoID;
        _solTaken = solTaken;
        _cameraName = [cameraName copy];
        _earthDate = [earthDate copy];
        _imageURL = [imageURL copy];
    }
    return self;
}

- (instancetype)init
{
    return [self initWithPhotoID:0 solTaken:0 cameraName:@"" earthDate:0 imageURL:@""];
}

- (instancetype)initWithPhotoDictionary:(NSDictionary<NSString *,id> *)photoDictionary
{
    
    NSInteger photoID = [photoDictionary[@"id"] integerValue];
    NSInteger solTaken = [photoDictionary[@"sol"] integerValue];
    NSDictionary *cameraDictionary = photoDictionary[@"camera"];
    NSString *camera = cameraDictionary[@"name"];
    NSString *earthDate = cameraDictionary[@"earth_date"];
    NSString *imageURL = cameraDictionary[@"image_src"];
    
        return [self initWithPhotoID:photoID solTaken:solTaken cameraName:camera earthDate:earthDate imageURL:imageURL];
}

@end
