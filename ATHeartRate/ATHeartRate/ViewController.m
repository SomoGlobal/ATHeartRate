//
//  ViewController.m
//  ATHeartRate
//
//  Created by Brandon Lehner on 3/16/15.
//  Copyright (c) 2015 Brandon Lehner. All rights reserved.
//

#import "ViewController.h"
#import "HeartRateDetectionModel.h"

@interface ViewController () <HeartRateDetectionModelDelegate>

@property (strong, nonatomic) HeartRateDetectionModel *heartRateModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.heartRateModel = [[HeartRateDetectionModel alloc] init];
    [self.heartRateModel setDelegate:self];
    [self.heartRateModel startDetection];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - HeartRateDetectionModelDelegate

- (void)heartRateStart {
    NSLog(@"Heart rate stop");
}

- (void)heartRateUpdate:(int)bpm atTime:(int)seconds {
    NSLog(@"Heart update: %d", bpm);
}

- (void)heartRateEnd {
    NSLog(@"Heart rate end");
}

- (void)heartRateError:(NSError *)error {
    NSLog(@"Heart rate error: %@", error);
}

@end
