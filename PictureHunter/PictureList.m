//
//  PictureList.m
//  PictureHunter
//
//  Created by Alvaro Pereda on 11/05/2013.
//  Copyright (c) 2013 Alvaro Pereda. All rights reserved.
//

#import "PictureList.h"

@implementation PictureList
-(id)initWithTitle:(NSString *)title
{
    self = [super init];
    
    if (self) {
        
        _title = title;
        return self;
        
    }
    
    return nil;
}
@end
