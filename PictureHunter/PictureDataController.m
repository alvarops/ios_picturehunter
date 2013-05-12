//
//  PictureDataController.m
//  PictureHunter
//
//  Created by Alvaro Pereda on 11/05/2013.
//  Copyright (c) 2013 Alvaro Pereda. All rights reserved.
//

#import "PictureDataController.h"

@implementation PictureDataController
- (void)initializeDefaultDataList {
    
    NSMutableArray *pictureList = [[NSMutableArray alloc] init];
    
    self.masterPictureList = pictureList;
    
   /* Picture *picture;
    
    NSDate *today = [NSDate date];
    
    picture = [[Picture alloc] initWithTitle:@"Pigeon" date:today location:@"location"];
    
    [self addPictureWithPicture:picture];
    */
}

- (void)setMasterPictureList:(NSMutableArray *)newList {
    
    if (_masterPictureList != newList) {
        _masterPictureList = [newList mutableCopy];
        
    }
    
}

- (id)init {
    
    if (self = [super init]) {
        [self initializeDefaultDataList];
        return self;
    }
    
    return nil;
    
}

- (NSUInteger)countOfList {
    return [self.masterPictureList count];
}

- (Picture *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.masterPictureList objectAtIndex:theIndex];
}

-(void)addPictureWithPicture:(Picture *)picture {
    [self.masterPictureList addObject:picture];
}

@end
