//
//  DNMMarsRoverClient.h
//  MarsRover
//
//  Created by Demick McMullin on 3/8/17.
//  Copyright © 2017 Demick McMullin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DNMRover;
@class DNMPhoto;
@class DNMSol;

@interface DNMMarsRoverClient : NSObject


//fetchAllMarsRoversWithCompletion has a completion block as a parameter that returns an array of rover names, and an error.
+ (void)fetchAllMarsRoversWithCompletion:(void (^)(NSArray *))completion;


//fetchMissionManifestForRoverNamed takes in a string and has a completion block that returns an instance of your rover model, and an error
+ (void)fetchMissionManifestForRoverNamed:(NSString *)roverName completion:(void (^)(DNMRover *))completion;

+ (void)fetchSolDescriptionerWithName:(NSInteger *)solName completion:(void (^)(DNMSol *))completion;
