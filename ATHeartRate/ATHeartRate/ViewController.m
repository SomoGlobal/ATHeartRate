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

@property (weak, nonatomic) IBOutlet UILabel *heartRateLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressedStart:(id)sender {
    [self.startButton setEnabled:NO];
    [self.heartRateModel startDetection];
}

#pragma mark - HeartRateDetectionModelDelegate

- (void)heartRateStart {
    NSLog(@"Heart rate start");
}

- (void)heartRateUpdate:(int)bpm atTime:(int)seconds {
    NSLog(@"Heart update: %d", bpm);
    [self.heartRateLabel setText:[NSString stringWithFormat:@"%d", bpm]];
}

- (void)heartRateEnd {
    NSLog(@"Heart rate end");
    [self.startButton setEnabled:YES];
}

- (void)heartRateError:(NSError *)error {
    NSLog(@"Heart rate error: %@", error);
    [self.startButton setEnabled:YES];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error!" message:@"Bad hue" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:nil];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
