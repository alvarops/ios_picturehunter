//
//  Picture.m
//  PictureHunter
//
//  Created by Alvaro Pereda on 11/05/2013.
//  Copyright (c) 2013 Alvaro Pereda. All rights reserved.
//

#import "Picture.h"
#import <CoreLocation/CoreLocation.h>

@implementation Picture
-(id)initWithTitle:(NSString *)title date:(NSDate *)date location:(CLLocation *)location urlString:(NSString *)urlString
{
    self = [super init];
    
    if (self) {
        
        _title = title;
        _location = location;
        _date = date;
        _urlString = urlString;
        return self;
        
    }
    
    return nil;
}

-(id)initWithTitle:(NSString *)title date:(NSDate *)date location:(CLLocation *)location
{
    return [self initWithTitle:title date:date location:location urlString:NULL];
}

@end
