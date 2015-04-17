//
//  AnnotationSettingsViewController.h
//  Assignment 6b
//
//  Created by Jon on 12/10/14.
//  Copyright (c) 2014 Jon Beacher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnnotationSettingsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *annotationTitleTextField;
@property (strong, nonatomic) IBOutlet UITextField *annotationSubtitleTextField;
@property (strong, nonatomic) IBOutlet UIPickerView *pinColorPicker;
@property (strong, nonatomic) IBOutlet UISegmentedControl *connectionStrengthSegmentControl;
@property (strong, nonatomic) NSNumber* latitude;
@property (strong, nonatomic) NSNumber* longitude;

- (IBAction)pressedAnnotationSettingsDone:(id)sender;

-(void) initGPSSignal:(NSNumber*)gpsSignalparameter andLongitude:(NSNumber*)longitude andLatitude:(NSNumber*)latitude;

-(IBAction) backgroundTap:(id)sender;

@end
