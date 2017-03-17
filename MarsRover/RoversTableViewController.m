//
//  RoversTableViewController.m
//  MarsRover
//
//  Created by Demick McMullin on 3/9/17.
//  Copyright © 2017 Demick McMullin. All rights reserved.
//

#import "RoversTableViewController.h"
#import "DNMMarsRoverClient.h"
#import "RoverManifestViewController.h"

@interface RoversTableViewController ()

@end

@implementation RoversTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [DNMMarsRoverClient fetchAllMarsRoversWithCompletion:^(NSArray *rovers) {
        if (!rovers) {
            NSLog(@"Error");
        }
         self.rovers = rovers;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.rovers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"roverCell" forIndexPath:indexPath];
    NSString *rover = self.rovers[indexPath.row];
    cell.textLabel.text = rover;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    NSString *rover = self.rovers[indexPath.row];
    
    RoverManifestViewController *searchRover = (RoverManifestViewController *)segue.destinationViewController;
    
    searchRover.roverToSearch = rover;
}



@end
