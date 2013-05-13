//
//  ParseOperations.h
//  PictureHunter
//
//  Created by Alvaro Pereda on 12/05/2013.
//  Copyright (c) 2013 Alvaro Pereda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParseOperations : NSOperation
// A block to call when an error is encountered during parsing.
@property (nonatomic, copy) void (^errorHandler)(NSError *error);

// NSArray containing Picture instances for each entry parsed
// from the input data.
// Only meaningful after the operation has completed.
@property (nonatomic, strong, readonly) NSArray *pictureList;

// The initializer for this NSOperation subclass.
- (id)initWithData:(NSData *)data;


@end
