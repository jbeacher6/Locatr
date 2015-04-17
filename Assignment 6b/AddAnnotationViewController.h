//
//  AddAnnotationViewController.h
//  Assignment 6b
//
//  Created by Jon on 12/10/14.
//  Copyright (c) 2014 Jon Beacher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

@interface AddAnnotationViewController : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate>
@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong,nonatomic) CLLocation *bestLocationWithSignal;
@property (strong, nonatomic) NSNumber *latitude;
@property (strong, nonatomic) NSNumber *longitude;
@property (strong, nonatomic) NSNumber *GPSsignal;

- (IBAction) saveLocationButtonPressed:(id)sender;
- (IBAction) setMapSegmentedControl:(id) sender;
@end
