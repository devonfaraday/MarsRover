//
//  DNMPhoto.h
//  MarsRover
//
//  Created by Demick McMullin on 3/7/17.
//  Copyright © 2017 Demick McMullin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DNMPhoto : NSObject

- (instancetype)initWithPhotoID:(NSInteger)photoID solTaken:(NSInteger)solTaken cameraName:(NSString *)cameraName earthDate:(NSString *)earthDate imageURL:(NSString *)imageURL;

- (instancetype)initWithPhotoDictionary:(NSDictionary<NSString *, id> *)photoDictionary;

@property (nonatomic, readonly) NSInteger photoID;
@property (nonatomic, readonly) NSInteger solTaken;
@property (nonatomic, copy, readonly) NSString *cameraName;
@property (nonatomic, copy, readonly) NSString *earthDate;
@property (nonatomic, copy, readonly) NSString *imageURL;



@end
