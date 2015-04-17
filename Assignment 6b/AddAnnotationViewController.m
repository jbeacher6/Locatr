//
//  AddAnnotationViewController.m
//  Assignment 6b
//
//  Created by Jon on 12/10/14.
//  Copyright (c) 2014 Jon Beacher. All rights reserved.
//

#import "AddAnnotationViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>
#import "AnnotationSettingsViewController.h"
//#import "MapViewAnnotation.h"
#define SPAN = 0.1f;


@implementation AddAnnotationViewController

@synthesize locationManager, mapView, bestLocationWithSignal,latitude,longitude, GPSsignal;

- (void)viewDidLoad {
    [super viewDidLoad];
    if(locationManager == nil) {
        locationManager = [[CLLocationManager alloc] init];
    }
    if(latitude == nil) {
        latitude =  [[NSNumber alloc] init];
    }
    if(longitude == nil) {
        longitude = [[NSNumber alloc] init];
    }
    if(!GPSsignal) {
        GPSsignal = [[NSNumber alloc] init];
    }
    
    [self.mapView setDelegate:self];
    [self.mapView setShowsUserLocation:YES];
    
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backBarButton;
}

 #pragma mark - Map

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    CLLocationCoordinate2D location = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location, 2000, 2000);
    [self.mapView setRegion:region animated:NO];
}

-(void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error {
    NSLog(@"error: %@:", error);
}

-(IBAction) setMapSegmentedControl:(id) sender {
    switch (((UISegmentedControl*) sender).selectedSegmentIndex) {
        case 0:
            mapView.mapType = MKMapTypeHybrid;
            break;
        case 1:
            mapView.mapType = MKMapTypeSatellite;
            break;
        case 2:
            mapView.mapType = MKMapTypeStandard;
            break;
            
        default:
            break;
    }
}

- (IBAction)saveLocationButtonPressed:(id)sender {
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    [locationManager requestWhenInUseAuthorization];
    [locationManager startUpdatingLocation];
}

 #pragma mark - LocationManager

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSString *errorType =
    (error.code == kCLErrorDenied) ? @"Access Denied" : @"Unknown Error, Try Again";
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Error getting location"
                          message:errorType
                          delegate:self
                          cancelButtonTitle:NSLocalizedString(@"Ok", @"Cancel")
                          otherButtonTitles:nil];
    [alert show];
}

- (void)locationManager:(CLLocationManager *)locationmanager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    NSLog(@"Location: %@", newLocation);
    
    CLLocationAccuracy accuracy = newLocation.horizontalAccuracy;
    if (accuracy > kCLLocationAccuracyKilometer ) {//2
        NSLog(@"tower");
        GPSsignal = [NSNumber numberWithInt:2];
    } else if (accuracy > kCLLocationAccuracyHundredMeters) {//4
        GPSsignal = [NSNumber numberWithInt:4];
        NSLog(@"wifi");
    } else if (accuracy >  kCLLocationAccuracyNearestTenMeters) {//gps 5
        GPSsignal = [NSNumber numberWithInt:5];
        NSLog(@"1 bar");
    }
    else if (accuracy > kCLLocationAccuracyBest) {//gps 6 bar
        GPSsignal = [NSNumber numberWithInt:6];
        NSLog(@"2 bar");
    } else {
        GPSsignal = [NSNumber numberWithInt:7];
        NSLog(@"3+ bars");//gps 7 bar
    }
    
    CLLocation *currentLocation = newLocation;
    if (currentLocation != nil) {
        latitude = [NSNumber numberWithDouble:currentLocation.coordinate.latitude];
        longitude = [NSNumber numberWithDouble:currentLocation.coordinate.longitude];
    }
    [locationmanager stopUpdatingLocation];
    [self createAnnotation];
    NSLog(@":%@", latitude);
    NSLog(@":%@", longitude);
}

 #pragma mark - Annotation

- (void) createAnnotation {
    //Create annotation class
    //NSMutableArray *locations = [[NSMutableArray alloc] init];
    //CLLocationCoordinate2D location;
    //Annotation
    
    MKPointAnnotation *myAnnotation = [[MKPointAnnotation alloc]init];
    CLLocationCoordinate2D pinCoordinate;
    pinCoordinate.latitude = [latitude doubleValue];
    pinCoordinate.longitude = [longitude doubleValue];
    myAnnotation.coordinate = pinCoordinate;
    myAnnotation.title = @"A title";
    myAnnotation.subtitle = @"Subtitle";
    //myAnnotation.pinColor = MKPinAnnotationColorBlue;
    [self.mapView addAnnotation:myAnnotation];
}

-(MKAnnotationView *)mapView:(MKMapView *)mapViewParameter viewForAnnotation:(id<MKAnnotation>)annotation {
    //if annotation is the user location, return nil to get default blue-dot...
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    //create purple pin view for all other annotations...
    static NSString *reuseId = @"hello";
    
    MKPinAnnotationView *myPersonalView = (MKPinAnnotationView *)[mapViewParameter dequeueReusableAnnotationViewWithIdentifier:reuseId];
    if (myPersonalView == nil) {
        myPersonalView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseId];
        myPersonalView.pinColor = MKPinAnnotationColorPurple;
        myPersonalView.canShowCallout = YES;
    }
    else {
        //if re-using view from another annotation, point view to current annotation...
        myPersonalView.annotation = annotation;
    }
    return myPersonalView;
}

 #pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //AnnotationSettingsViewController *annotationDetailsController;// = [tabar.viewControllers objectAtIndex:0];
    AnnotationSettingsViewController *annotationDetailsController = segue.destinationViewController;
    
    if([[segue identifier] isEqualToString:@"showAnnotationSettingsViewController"]) {
        [annotationDetailsController initGPSSignal:GPSsignal andLongitude:longitude andLatitude:latitude];
    }
}

@end