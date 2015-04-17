//
//  MapViewController.m
//  Assignment 6b
//
//  Created by Jon on 12/10/14.
//  Copyright (c) 2014 Jon Beacher. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

@implementation MapViewController

@synthesize locationManager, mapView, bestLocationWithSignal,latitude,longitude;

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
    [locationManager requestWhenInUseAuthorization];
    //[locationManager requestAlwaysAuthorization];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    [locationManager startUpdatingLocation];
    [self.mapView setDelegate:self];
    [self.mapView setShowsUserLocation:YES];
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    CLLocationCoordinate2D location = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location, 2000, 2000);
    [self.mapView setRegion:region animated:NO];
}

-(void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error {
    NSLog(@"error: %@:", error);
}

-(IBAction) setMapSegmentController:(id) sender {
    switch (((UISegmentedControl*) sender).selectedSegmentIndex) {
        case 0:
            mapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            mapView.mapType = MKMapTypeSatellite;
            break;
        case 2:
            mapView.mapType = MKMapTypeHybrid;
            break;
            
        default:
            break;
    }
}


@end
