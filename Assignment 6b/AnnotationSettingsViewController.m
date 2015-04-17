//
//  AnnotationSettingsViewController.m
//  Assignment 6b
//
//  Created by Jon on 12/10/14.
//  Copyright (c) 2014 Jon Beacher. All rights reserved.
//

#import "AnnotationSettingsViewController.h"

@interface AnnotationSettingsViewController ()

@end

@implementation AnnotationSettingsViewController
@synthesize annotationTitleTextField, annotationSubtitleTextField, pinColorPicker, connectionStrengthSegmentControl, longitude, latitude;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // change the back button and add an event handler
    if(!longitude) {
        longitude = [[NSNumber alloc] init];
    }
    if(!latitude) {
        latitude = [[NSNumber alloc] init];
    }
    if(!connectionStrengthSegmentControl) {
        connectionStrengthSegmentControl = [[UISegmentedControl alloc] init];
        connectionStrengthSegmentControl.selectedSegmentIndex = UISegmentedControlNoSegment;
    }
    
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) initGPSSignal:(NSNumber*)gpsSignalParameter andLongitude:(NSNumber*) longitudeParameter andLatitude:(NSNumber*) latitudeParameter {
    NSInteger segValue = [gpsSignalParameter intValue];
    [connectionStrengthSegmentControl setSelectedSegmentIndex:segValue];
    //connectionStrengthSegmentControl.selectedSegmentIndex = segValue;
    longitude = longitudeParameter;
    latitude = latitudeParameter;
}

- (IBAction)pressedAnnotationSettingsDone:(id)sender {
    NSString *title = annotationTitleTextField.text;
    NSString *subtitle = annotationSubtitleTextField.text;
    
    NSLog(@"title:%@", title);
    NSLog(@"subtitle:%@", subtitle);
    NSLog(@"%@", latitude);
    NSLog(@"%@", longitude);
}

-(IBAction) backgroundTap:(id)sender {
    [sender resignFirstResponder];
    [self.view endEditing:YES];
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
