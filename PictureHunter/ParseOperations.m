//
//  ParseOperations.m
//  PictureHunter
//
//  Created by Alvaro Pereda on 12/05/2013.
//  Copyright (c) 2013 Alvaro Pereda. All rights reserved.
//

#import "ParseOperations.h"
#import "Picture.h"

@interface ParseOperations()
@property (nonatomic, strong) NSArray *pictureList;
@property (nonatomic, strong) NSData *dataToParse;
@property (nonatomic, strong) NSMutableArray *workingArray;
@property (nonatomic, strong) Picture *workingEntry;
@end

@implementation ParseOperations

-(id)initWithData:(NSData *)data {
    self = [super init];
    if (self != nil)
    {
        _dataToParse = data;
    }
    return self;
}

// -------------------------------------------------------------------------------
//	main
//  Entry point for the operation.
// -------------------------------------------------------------------------------
- (void)main
{
    // The default implemetation of the -start method sets up an autorelease pool
    // just before invoking -main however it does NOT setup an excption handler
    // before invoking -main.  If an exception is thrown here, the app will be
    // terminated.
    
    self.workingArray = [NSMutableArray array];
    
    
    NSError *e = nil;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData: self.dataToParse options: NSJSONReadingMutableContainers error: &e];
    
    if (!jsonArray) {
        NSLog(@"Error parsing JSON: %@", e);
    } else {
        for(NSDictionary *item in jsonArray) {
            NSLog(@"Item: %@", item);
            NSString *name = [item objectForKey:@"name"];
            NSString *photo = [item objectForKey:@"title"];
            NSString *lat = [item objectForKey:@"lat"];
            NSString *lon = [item objectForKey:@"lon"];
            CLLocation *location = [[CLLocation alloc] initWithLatitude:[lat floatValue] longitude:[lon floatValue]];

            NSDate *today = [NSDate date];
            Picture *pic = [[Picture alloc] initWithTitle:photo date:today location:location urlString:name];
            [self.workingArray addObject:pic];
            
        }
    }
    
    
    if (![self isCancelled])
    {
        // Set appRecordList to the result of our parsing
        self.pictureList = [NSArray arrayWithArray:self.workingArray];
    }
    
    self.workingArray = nil;
    self.dataToParse = nil;
}



@end
