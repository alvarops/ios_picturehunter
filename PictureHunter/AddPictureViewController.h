//
//  AddPictureViewController.h
//  PictureHunter
//
//  Created by Alvaro Pereda on 12/05/2013.
//  Copyright (c) 2013 Alvaro Pereda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@class Picture;
@protocol CoreLocationControllerDelegate
@required
- (void)locationUpdate:(CLLocation *)location; // Our location updates are sent here
- (void)locationError:(NSError *)error; // Any errors are sent here
@end

@interface AddPictureViewController : UITableViewController<UITextFieldDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate, CLLocationManagerDelegate, CoreLocationControllerDelegate>
{
    CLLocationManager *locMgr;
    id delegate;
}
@property (weak, nonatomic) IBOutlet UITextField *titleInput;
@property (weak, nonatomic) IBOutlet UITextField *locationInput;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) Picture *picture;
@property (nonatomic, copy) CLLocation *location;

@property (nonatomic, retain) CLLocationManager *locMgr;
@property (nonatomic, assign) id delegate;

- (IBAction)done:(UIStoryboardSegue *)segue;
- (IBAction)pickPicture:(UIButton *)sender;
- (IBAction)cancel:(UIStoryboardSegue *)segue;
- (IBAction)selectImage:(UITextField *)textField;
@end
