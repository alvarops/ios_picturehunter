//
//  PictureListMasterViewController.h
//  PictureHunter
//
//  Created by Alvaro Pereda on 11/05/2013.
//  Copyright (c) 2013 Alvaro Pereda. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PictureDataController;
@interface PictureListMasterViewController : UITableViewController

@property (nonatomic, strong) PictureDataController *dataController;

- (IBAction)refreshTable:(UIBarButtonItem *)sender;
-(void)addPicturesWithPictures:(NSArray *)pictures;
@end
