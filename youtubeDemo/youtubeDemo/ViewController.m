//
//  ViewController.m
//  youtubeDemo
//
//  Created by wanggang on 7/2/16.
//  Copyright © 2016 wanggang. All rights reserved.
//

#import "ViewController.h"
#import "GTLR/GTLRUtilities.h"
#import "GTLR/GTMSessionUploadFetcher.h"
#import "GTLR/GTMSessionFetcherLogging.h"
#import "GTLR/GTMOAuth2ViewControllerTouch.h"
#import "GTLRYouTubeService.h"


@interface ViewController ()
 @property (nonatomic, readonly) GTLRYouTubeService *youTubeService;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *const kKeychainItemName = @"youtubeDemo: YouTube";
    NSString *clientID = nil;//_clientIDField.stringValue;
    NSString *clientSecret = nil;//_clientSecretField.stringValue;
    NSError* error = nil;
    NSLog(@"clientID: %@, clientSecret:%@\n", clientID, clientSecret);
    
    GTMOAuth2Authentication *auth =
    [GTMOAuth2ViewControllerTouch authForGoogleFromKeychainForName:kKeychainItemName
                                                          clientID:clientID
                                                      clientSecret:clientSecret
                                                             error:&error];
    NSLog(@"authForGoogleFromKeychainForName ret:%@\n", error);
    self.youTubeService.authorizer = auth;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

// Get a service object with the current username/password.
//
// A "service" object handles networking tasks.  Service objects
// contain user authentication information as well as networking
// state information such as cookies set by the server in response
// to queries.

- (GTLRYouTubeService *)youTubeService {
    static GTLRYouTubeService *service;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[GTLRYouTubeService alloc] init];
        
        // Have the service object set tickets to fetch consecutive pages
        // of the feed so we do not need to manually fetch them.
        service.shouldFetchNextPages = YES;
        
        // Have the service object set tickets to retry temporary error conditions
        // automatically.
        service.retryEnabled = YES;
    });
    return service;
}

@end
