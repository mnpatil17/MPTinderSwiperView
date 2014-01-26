//
//  MPViewController.m
//  MPTinderSwiperViewExample
//
//  Created by Mihir Patil on 1/26/14.
//  Copyright (c) 2014 Mihir Patil. All rights reserved.

#import "MPViewController.h"
#import "MPTinderSwiperView.h"

@interface MPViewController ()

@end

@implementation MPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /** This is the implementation necessary to create a swipable table view. **/
    MPTinderSwiperView* subView = [[MPTinderSwiperView alloc] initWithSuperView:self.view
                                                                       andFrame:CGRectMake(20, 20, 250, 250)
                                                      andShouldMoveHorizontally:YES
                                                        andShouldMoveVertically:NO
                                                             andBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:subView];
}


@end
