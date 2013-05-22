//
//  PictureDataController.m
//  PictureHunter
//
//  Created by Alvaro Pereda on 11/05/2013.
//  Copyright (c) 2013 Alvaro Pereda. All rights reserved.
//

#import "PictureDataController.h"

@implementation PictureDataController
- (void)initializeDefaultDataList {
    
    NSMutableArray *pictureList = [[NSMutableArray alloc] init];
    
    self.masterPictureList = pictureList;
    
   /* Picture *picture;
    
    NSDate *today = [NSDate date];
    
    picture = [[Picture alloc] initWithTitle:@"Pigeon" date:today location:@"location"];
    
    [self addPictureWithPicture:picture];
    */
}

-(void)clear
{
    [_masterPictureList removeAllObjects];
}

- (void)setMasterPictureList:(NSMutableArray *)newList {
    
    if (_masterPictureList != newList) {
        _masterPictureList = [newList mutableCopy];
        
    }
    
}

- (id)init {
    
    if (self = [super init]) {
        [self initializeDefaultDataList];
        return self;
    }
    
    return nil;
    
}

- (NSUInteger)countOfList {
    return [self.masterPictureList count];
}

- (Picture *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.masterPictureList objectAtIndex:theIndex];
}

-(void)addPictureWithPicture:(Picture *)picture {
    [self.masterPictureList addObject:picture];
}
- (void)createPictureWithPicture:(Picture *)picture {
    [self uploadImage:picture toURL:[NSURL URLWithString:@"http://picturehunter.herokuapp.com/api/images/"]];
    [self.masterPictureList addObject:picture];
}

- (void)uploadImage:(Picture *)picture toURL:(NSURL *)url {
    
    // encode the image as JPEG
    NSData *imageData = UIImageJPEGRepresentation(picture.image, 0.9);
    
    // set up the request
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    
    // create a boundary to delineate the file
    NSString *boundary = @"14737809831466499882746641449";
    // tell the server what to expect
    NSString *contentType =
    [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    // make a buffer for the post body
    NSMutableData *body = [NSMutableData data];
    
    // add a boundary to show where the lat starts
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary]
                      dataUsingEncoding:NSASCIIStringEncoding]];
    
    // add the lat
    [body appendData:[
                      @"Content-Disposition: form-data; name=\"lat\"\r\n\r\n"
                      dataUsingEncoding:NSASCIIStringEncoding]];
    [body appendData:[[[NSString alloc] initWithFormat:@"%f", picture.location.coordinate.latitude] dataUsingEncoding:NSASCIIStringEncoding]];
    
    // add a boundary to show where the lon starts
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary]
                      dataUsingEncoding:NSASCIIStringEncoding]];
    
    // add the lon
    [body appendData:[
                      @"Content-Disposition: form-data; name=\"lon\"\r\n\r\n"
                      dataUsingEncoding:NSASCIIStringEncoding]];
    [body appendData:[[[NSString alloc] initWithFormat:@"%f", picture.location.coordinate.longitude]dataUsingEncoding:NSASCIIStringEncoding]];
    
    // add a boundary to show where the title starts
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary]
                      dataUsingEncoding:NSASCIIStringEncoding]];
    
    // add the title
    [body appendData:[
                      @"Content-Disposition: form-data; name=\"title\"\r\n\r\n"
                      dataUsingEncoding:NSASCIIStringEncoding]];
    [body appendData:[[[NSString alloc] initWithFormat:@"%@", picture.title] dataUsingEncoding:NSASCIIStringEncoding]];
    
    // add a boundary to show where the file starts
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary]
                      dataUsingEncoding:NSASCIIStringEncoding]];
    
    // add a form field
    [body appendData:[[NSString stringWithFormat:
                      @"Content-Disposition: form-data; name=\"photo\"; filename=\"%@.jpeg\"\r\n",[picture.title stringByReplacingOccurrencesOfString:@" " withString:@"_"]]
                      dataUsingEncoding:NSASCIIStringEncoding]];
    
    // tell the server to expect some binary
    [body appendData:[
                      @"Content-Type: application/octet-stream\r\n"
                      dataUsingEncoding:NSASCIIStringEncoding]];
    [body appendData:[
                      @"Content-Transfer-Encoding: binary\r\n"
                      dataUsingEncoding:NSASCIIStringEncoding]];
    [body appendData:[[NSString stringWithFormat:
                       @"Content-Length: %i\r\n\r\n", imageData.length]
                      dataUsingEncoding:NSASCIIStringEncoding]];
    
    // add the payload
    [body appendData:[NSData dataWithData:imageData]];
    
    // tell the server the payload has ended
    [body appendData:
     [[NSString stringWithFormat:@"\r\n--%@--\r\n", boundary]
      dataUsingEncoding:NSASCIIStringEncoding]];
    
    // add the POST data as the request body
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:body];
    
    // now lets make the connection to the web
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@", returnString);
}
@end
