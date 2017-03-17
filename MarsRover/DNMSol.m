//
//  DNMSol.m
//  MarsRover
//
//  Created by Demick McMullin on 3/7/17.
//  Copyright © 2017 Demick McMullin. All rights reserved.
//

#import "DNMSol.h"

@implementation DNMSol

- (instancetype)initWithSolName:(NSInteger)solName numberOfPhotosDuringSol:(NSInteger)numberOfPhotosDuringSol cameras:(NSArray<NSString *> *)cameras
{
    self = [super init];
    if (self) {
        _solName = solName;
        _numberOfPhotosDuringSol = numberOfPhotosDuringSol;
        _cameras = [cameras copy];
    }
    return self;
}

- (instancetype)init
{
    return [self initWithSolName:0 numberOfPhotosDuringSol:0 cameras:@[]];
}

- (instancetype)initWithSolDictionary:(NSDictionary<NSString *,id> *)solDictionary
{
   
    NSInteger solName = [solDictionary[@"sol"] integerValue];
    NSArray *photosArray = solDictionary[@"photos"];
    NSMutableArray<NSString *> *solCameras = [NSMutableArray new];

    NSInteger numberOfPhotosDuringSol = photosArray.count + 1;
    
    for (NSDictionary *photos in photosArray) {
        NSDictionary *solRoverDictionary = photos[@"rover"][@"cameras"];
        for (NSDictionary *cameras in solRoverDictionary) {
            NSString *camera = cameras[@"name"];
            [solCameras addObject:camera];
        }
    }
    return [self initWithSolName:solName numberOfPhotosDuringSol:numberOfPhotosDuringSol cameras:solCameras];
}
@end

