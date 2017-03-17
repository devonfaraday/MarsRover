//
//  DNMRover.h
//  MarsRover
//
//  Created by Demick McMullin on 3/7/17.
//  Copyright © 2017 Demick McMullin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DNMSol.h"


@interface DNMRover : NSObject

- (instancetype)initWithRover:(NSString *)roverName launchDate:(NSString *)launchDate landingDate:(NSString *)landingDate maxSol:(NSInteger)maxSol maxDate:(NSString *)maxDate status:(NSString *)status numberOfPhotos:(NSInteger)numberOfPhotos solDescription:(NSArray*)solDescription;

- (instancetype)initWithRoverDictionary:(NSDictionary<NSString *, id> *)roverDictionaries;

@property (nonatomic, copy, readonly) NSString *roverName;
@property (nonatomic, copy, readonly) NSString *launchDate;
@property (nonatomic, copy, readonly) NSString *landingDate;
@property (nonatomic, readonly) NSInteger maxSol;
@property (nonatomic, copy, readonly) NSString *maxDate;
@property (nonatomic, copy, readonly) NSString *status;
@property (nonatomic, readonly) NSInteger numberOfPhotos;
@property (nonatomic, strong) NSArray *solDescription;



@end
