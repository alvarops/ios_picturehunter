//
//  AddPictureViewController.h
//  PictureHunter
//
//  Created by Alvaro Pereda on 12/05/2013.
//  Copyright (c) 2013 Alvaro Pereda. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Picture;

@interface AddPictureViewController : UITableViewController<UITextFieldDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *titleInput;
@property (weak, nonatomic) IBOutlet UITextField *locationInput;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) Picture *picture;

- (IBAction)done:(UIStoryboardSegue *)segue;
- (IBAction)pickPicture:(UIButton *)sender;
- (IBAction)cancel:(UIStoryboardSegue *)segue;
- (IBAction)selectImage:(UITextField *)textField;
@end
