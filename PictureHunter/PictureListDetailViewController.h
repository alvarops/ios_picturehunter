//
//  PictureListDetailViewController.h
//  PictureHunter
//
//  Created by Alvaro Pereda on 11/05/2013.
//  Copyright (c) 2013 Alvaro Pereda. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Picture;

@interface PictureListDetailViewController : UITableViewController

@property (strong, nonatomic) Picture *picture;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
