MPTinderSwiperView
==================

Allows the user to implement the swiping interface using UIViews similar to that found in the Tinder App. Alters the TinderSwipe application created by Rex Fatahi to abstract away the majority of the process. 

<h4> Using MPTinderSwiperView </h4>

Add the following lines of code at the top of the View Controller implementation (.m) file that you would like the swiping to take place from:

<i> At the top </i>

    #import "MPTinderSwiperView.h"


<i> In the viewDidLoad method </i>

    MPTinderSwiperView* subView = [[MPTinderSwiperView alloc] initWithSuperView:self.view
                                                                       andFrame:CGRectMake(20, 20, 300, 300)
                                                      andShouldMoveHorizontally:YES
                                                        andShouldMoveVertically:NO
                                                             andBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:subView];

Of course, you can edit the CGRect to change the size of the frame.
