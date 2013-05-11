//
//  PictureDataController.h
//  PictureHunter
//
//  Created by Alvaro Pereda on 11/05/2013.
//  Copyright (c) 2013 Alvaro Pereda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Picture.h"

@class Picture;

@interface PictureDataController : NSObject
@property (nonatomic, copy) NSMutableArray *masterPictureList;

- (NSUInteger)countOfList;
- (Picture *)objectInListAtIndex:(NSUInteger)theIndex;
- (void)addPictureWithPicture:(Picture *)picture;
- (void)initializeDefaultDataList;

@end
