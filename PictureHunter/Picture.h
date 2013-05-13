//
//  Picture.h
//  PictureHunter
//
//  Created by Alvaro Pereda on 11/05/2013.
//  Copyright (c) 2013 Alvaro Pereda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Picture : NSObject
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSDate *date;
@property (nonatomic, copy)CLLocation *location;
@property (nonatomic, copy)NSString *urlString;

@property (nonatomic, copy)UIImage *image;

-(id)initWithTitle:(NSString *)title date:(NSDate *)date location:(CLLocation*) location urlString:(NSString *)urlString;
-(id)initWithTitle:(NSString *)title date:(NSDate *)date location:(CLLocation*) location;
@end
