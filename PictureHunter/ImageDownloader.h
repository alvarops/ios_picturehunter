//
//  ImageDownloader.h
//  PictureHunter
//
//  Created by Alvaro Pereda on 12/05/2013.
//  Copyright (c) 2013 Alvaro Pereda. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Picture;

@interface ImageDownloader : NSObject
@property (nonatomic, strong) Picture *picture;
@property (nonatomic, copy) void (^completionHandler)(void);

- (void)startDownload;
- (void)cancelDownload;


@end
