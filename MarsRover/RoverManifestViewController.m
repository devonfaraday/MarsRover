//
//  RoverManifestViewController.m
//  MarsRover
//
//  Created by Demick McMullin on 3/15/17.
//  Copyright © 2017 Demick McMullin. All rights reserved.
//

#import "RoverManifestViewController.h"
#import "DNMMarsRoverClient.h"
#import "DNMRover.h"
#import "DNMSolCollectionViewCell.h"

@interface RoverManifestViewController ()
@property (weak, nonatomic) IBOutlet UILabel *roverNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *launchDateLabelText;
@property (weak, nonatomic) IBOutlet UILabel *landingDateLabelText;
@property (weak, nonatomic) IBOutlet UILabel *maxDateLabelText;
@property (weak, nonatomic) IBOutlet UILabel *maxSolLabelText;
@property (weak, nonatomic) IBOutlet UILabel *statusLabelText;
@property (weak, nonatomic) IBOutlet UILabel *totalImagesLabelText;




@end

@implementation RoverManifestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [DNMMarsRoverClient fetchMissionManifestForRoverNamed:self.roverToSearch completion:^(DNMRover *manifest) {
        if (!manifest) {
            NSLog(@"Error");
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            NSNumber *maxSol = @(manifest.maxSol);
            NSNumber *numberPhotos = @(manifest.numberOfPhotos);
            
            self.roverNameLabel.text = manifest.roverName;
            self.launchDateLabelText.text = manifest.launchDate;
            self.landingDateLabelText.text = manifest.landingDate;
            self.maxDateLabelText.text = manifest.maxDate;
            self.maxSolLabelText.text = [maxSol stringValue];
            self.statusLabelText.text = manifest.status;
            self.totalImagesLabelText.text = [numberPhotos stringValue];
            self.solDescriptions = manifest.solDescription;
            
        });
    }];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  
    return self.solDescriptions.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DNMSolCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"solCell" forIndexPath:indexPath];
    
    // Configure the cell
    NSInteger solName = [self.solDescriptions[indexPath.row] integerValue];
                         
    NSNumber *solDesc = @(solName);
    cell.sol = solDesc;
    
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
