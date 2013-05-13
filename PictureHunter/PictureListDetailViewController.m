//
//  PictureListDetailViewController.m
//  PictureHunter
//
//  Created by Alvaro Pereda on 11/05/2013.
//  Copyright (c) 2013 Alvaro Pereda. All rights reserved.
//

#import "PictureListDetailViewController.h"
#import "Picture.h"
#import "ImageDownloader.h"

@interface PictureListDetailViewController ()
@property (nonatomic, strong) NSMutableDictionary *imageDownloadsInProgress;
- (void)configureView;
@end

@implementation PictureListDetailViewController

#pragma mark - Managing the detail item

- (void)setPicture:(Picture *)newPicture {
    if (_picture != newPicture) {
        _picture = newPicture;
        //Update the view
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    Picture *thePicture = self.picture;
    
    static NSDateFormatter *formatter = nil;
    
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    
    if (thePicture) {
        self.titleLabel.text = thePicture.title;
        self.locationLabel.text = thePicture.location.description;
        self.dateLabel.text = [formatter stringFromDate:(NSDate *)thePicture.date];
        [self startImageDownload:thePicture];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    // terminate all pending download connections
    NSArray *allDownloads = [self.imageDownloadsInProgress allValues];
    [allDownloads makeObjectsPerformSelector:@selector(cancelDownload)];
    
    [self.imageDownloadsInProgress removeAllObjects];
}

- (void)startImageDownload:(Picture *)picture
{
    ImageDownloader *iconDownloader = [self.imageDownloadsInProgress objectForKey:picture.urlString];
    if (iconDownloader == nil)
    {
        iconDownloader = [[ImageDownloader alloc] init];
        iconDownloader.picture = picture;
        [iconDownloader setCompletionHandler:^{
            [self.imageView setImage:picture.image];
        }];
        [self.imageDownloadsInProgress setObject:iconDownloader forKey:picture.urlString];
        [iconDownloader startDownload];
    }
}


@end
