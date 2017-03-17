//
//  DNMRover.m
//  MarsRover
//
//  Created by Demick McMullin on 3/7/17.
//  Copyright © 2017 Demick McMullin. All rights reserved.
//

#import "DNMRover.h"
#import "DNMSol.h"

@implementation DNMRover

- (instancetype)initWithRover:(NSString *)roverName launchDate:(NSString *)launchDate landingDate:(NSString *)landingDate maxSol:(NSInteger)maxSol maxDate:(NSString *)maxDate status:(NSString *)status numberOfPhotos:(NSInteger)numberOfPhotos solDescription:(NSArray *)solDescription
{
    self = [super init];
    if (self) {
        _roverName = [roverName copy];
        _launchDate = [launchDate copy];
        _landingDate = [landingDate copy];
        _maxSol = maxSol;
        _maxDate = [maxDate copy];
        _status = [status copy];
        _numberOfPhotos = numberOfPhotos;
        _solDescription = [solDescription copy];
    }
    return self;
}

- (instancetype)init
    {
        return [self initWithRover:@"" launchDate:0 landingDate:0 maxSol:0 maxDate:0 status:@"" numberOfPhotos:0 solDescription:@[]];
    }
    
- (instancetype)initWithRoverDictionary:(NSDictionary<NSString *, id> *)roverDictionaries
{
    NSDictionary *roverDictionary = roverDictionaries[@"photo_manifest"];
    NSString *roverName = roverDictionary[@"name"];
    NSString *launchDate = roverDictionary[@"launch_date"];
    NSString *landingDate = roverDictionary[@"landing_date"];
    NSInteger maxSol = [roverDictionary[@"max_sol"] integerValue];
    NSString *maxDate = roverDictionary[@"max_date"];
    NSString *status = roverDictionary[@"status"];
    NSInteger numberOfPhotos = [roverDictionary[@"total_photos"] integerValue];
    NSArray *photoArray = roverDictionary[@"photos"];
    NSMutableArray *solArray = [NSMutableArray new];
    for (NSDictionary *photos in photoArray) {
            NSInteger internalSolDescription = [photos[@"sol"] integerValue];
        NSNumber *solDesc = @(internalSolDescription);
        [solArray addObject:solDesc];
    }
    
    return [self initWithRover:roverName launchDate:launchDate landingDate:landingDate maxSol:maxSol maxDate:maxDate status:status numberOfPhotos:numberOfPhotos solDescription:solArray];
}
@end
