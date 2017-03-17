//
//  RoverManifestViewController.h
//  MarsRover
//
//  Created by Demick McMullin on 3/15/17.
//  Copyright © 2017 Demick McMullin. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RoverManifestViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, copy) NSArray *solDescriptions;
@property (nonatomic, copy, readwrite) NSString *roverToSearch;

@end
