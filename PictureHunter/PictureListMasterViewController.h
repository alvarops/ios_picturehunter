//
//  PictureListMasterViewController.h
//  PictureHunter
//
//  Created by Alvaro Pereda on 11/05/2013.
//  Copyright (c) 2013 Alvaro Pereda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreLocationController.h"
@class PictureDataController;
@interface PictureListMasterViewController : UITableViewController <CoreLocationControllerDelegate>
//CoreLocationController *CLController;
@property (nonatomic, retain) CoreLocationController *CLController;
@property (nonatomic, strong) PictureDataController *dataController;
@end
