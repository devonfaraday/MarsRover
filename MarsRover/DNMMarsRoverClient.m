//
//  DNMMarsRoverClient.m
//  MarsRover
//
//  Created by Demick McMullin on 3/8/17.
//  Copyright © 2017 Demick McMullin. All rights reserved.
//

#import "DNMMarsRoverClient.h"
#import "DNMRover.h"


@implementation DNMMarsRoverClient

+ (void)fetchAllMarsRoversWithCompletion:(void (^)(NSArray *))completion
{
    
    NSString *apiKey = @"qzGsj0zsKk6CA9JZP1UjAbpQHabBfaPg2M5dGMB7";
    // set base url
    NSString *baseURLString = @"https://api.nasa.gov/mars-photos/api/v1/rovers";
    NSURL *baseURL = [[NSURL alloc] initWithString:baseURLString];
    
    // get components for url
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    NSURLQueryItem *apiKeyItem = [NSURLQueryItem queryItemWithName:@"api_key" value: apiKey];
    
    //
    urlComponents.queryItems = @[apiKeyItem];
    
    NSURL *marsRoversEndpoint = urlComponents.URL;
    //print current URL to Consol
    NSLog(@"%@", marsRoversEndpoint);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:marsRoversEndpoint completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) { NSLog(@"Error: %@", error);
            completion(nil);
            return;
        }
        
        if (!data) {
            NSLog(@"Error: No data returnes from data task");
            completion(nil);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (!jsonDictionary) {
            NSLog(@"Error: Could not serialize Data");
            completion(nil);
            return;
        }
        
        NSString *errorString = jsonDictionary[@"error"];
        
        if (errorString) {
            NSLog(@"%@", errorString);
            completion(nil);
            return;
        }
        NSMutableArray *rovers = [NSMutableArray new];
        
        NSArray *roversArray = jsonDictionary[@"rovers"];
        
        // loop through the array, and get the name of each rover out of the dictionary, and append it to the rovers array above.
        for (NSDictionary *marsRovers in roversArray) {
            NSString *rover = marsRovers[@"name"];
            [rovers addObject:rover];
        }
        completion(rovers);
        
    }] resume];
}

+ (void)fetchMissionManifestForRoverNamed:(NSString *)roverName completion:(void (^)(DNMRover *))completion
{
    
    NSString *apiKey = @"qzGsj0zsKk6CA9JZP1UjAbpQHabBfaPg2M5dGMB7";
    // set base url
    NSString *baseURLString = (@"https://api.nasa.gov/mars-photos/api/v1/manifests");
    NSURL *baseURL = [[NSURL alloc] initWithString:baseURLString];
    NSURL *manifestURL = [baseURL URLByAppendingPathComponent:roverName];
    // get components for url
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:manifestURL resolvingAgainstBaseURL:YES];
    
    
    NSURLQueryItem *apiKeyItem = [NSURLQueryItem queryItemWithName:@"api_key" value: apiKey];
    
    //
    urlComponents.queryItems = @[apiKeyItem];
    
    NSURL *manifestEndpoint = urlComponents.URL;
    //print current URL to Consol
    NSLog(@"%@", manifestEndpoint);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:manifestEndpoint completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) { NSLog(@"Error: %@", error);
            completion(nil);
            return;
        }
        
        if (!data) {
            NSLog(@"Error: No data returnes from data task");
            completion(nil);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (!jsonDictionary) {
            NSLog(@"Error: Could not serialize Data");
            completion(nil);
            return;
        }
        
        NSString *errorString = jsonDictionary[@"error"];
        
        if (errorString) {
            NSLog(@"%@", errorString);
            completion(nil);
            return;
        }
        
        
        DNMRover *manifest = [[DNMRover alloc]initWithRoverDictionary:jsonDictionary];
        
        // loop through the array, and get the name of each rover out of the dictionary, and append it to the rovers array above.
     
        completion(manifest);
        
    }] resume];
}

+(void)fetchSolDescriptionerWithName:(NSInteger *)solName completion:(void (^)(DNMSol *))completion
{
    NSString *apiKey = @"qzGsj0zsKk6CA9JZP1UjAbpQHabBfaPg2M5dGMB7";
    // set base url
    NSString *baseURLString = (@"https://api.nasa.gov/mars-photos/api/v1/photos");
    NSURL *baseURL = [[NSURL alloc] initWithString:baseURLString];
    NSURL *photoURL = [baseURL URLByAppendingPathComponent:roverName];
    // get components for url
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:manifestURL resolvingAgainstBaseURL:YES];
    
    
    NSURLQueryItem *apiKeyItem = [NSURLQueryItem queryItemWithName:@"api_key" value: apiKey];
    
    //
    urlComponents.queryItems = @[apiKeyItem];
    
    NSURL *manifestEndpoint = urlComponents.URL;
    //print current URL to Consol
    NSLog(@"%@", manifestEndpoint);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:manifestEndpoint completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) { NSLog(@"Error: %@", error);
            completion(nil);
            return;
        }
        
        if (!data) {
            NSLog(@"Error: No data returnes from data task");
            completion(nil);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (!jsonDictionary) {
            NSLog(@"Error: Could not serialize Data");
            completion(nil);
            return;
        }
        
        NSString *errorString = jsonDictionary[@"error"];
        
        if (errorString) {
            NSLog(@"%@", errorString);
            completion(nil);
            return;
        }
        
        
        DNMRover *manifest = [[DNMRover alloc]initWithRoverDictionary:jsonDictionary];
        
        // loop through the array, and get the name of each rover out of the dictionary, and append it to the rovers array above.
        
        completion(manifest);
        
    }] resume];
}
@end
