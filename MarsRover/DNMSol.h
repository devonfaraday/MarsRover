//
//  DNMSol.h
//  MarsRover
//
//  Created by Demick McMullin on 3/7/17.
//  Copyright © 2017 Demick McMullin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DNMSol : NSObject

- (instancetype)initWithSolName:(NSInteger)solName numberOfPhotosDuringSol:(NSInteger)numberOfPhotosDuringSol cameras:(NSArray<NSString *> *)cameras;

- (instancetype)initWithSolDictionary:(NSDictionary<NSString *, id> *)solDictionary;


@property (nonatomic, readonly) NSInteger solName;
@property (nonatomic, readonly) NSInteger numberOfPhotosDuringSol;
@property (nonatomic, copy, readonly) NSArray<NSString *> *cameras;


@end
