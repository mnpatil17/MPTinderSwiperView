//
//  SDDynamicSwipingView.h
//  tinderPractice
//
//  Arranged and abstracted by Mihir Patil on 1/25/14.
//  Original Implementation by Rex Fatahi.

#import <UIKit/UIKit.h>

@interface MPTinderSwiperView : UIView<UIGestureRecognizerDelegate>

/** Attribute Declarations **/
@property (strong, nonatomic) UIGestureRecognizer *pgr;
@property float swipeTransform;
@property float originalCenterXCoord;
@property float originalCenterYCoord;
@property BOOL shouldMoveHorizontally;
@property BOOL shouldMoveVertically;


/** Initializations **/
- (id)initWithSuperView:(UIView *)superView andFrame:(CGRect)frame andShouldMoveHorizontally:(BOOL)shouldMoveHorizontallyParam andShouldMoveVertically:(BOOL)shouldMoveVerticallyParam andBackgroundColor:(UIColor *)backgroundColor;

/** Handling the Panning **/
- (void)handlePan:(UIPanGestureRecognizer *)recognizer;
- (void) resetViewToOriginalPositionWithRecognizer:(UIGestureRecognizer *)recognizer;
- (float) amountToVaryHorizontally;
- (float) amountToVaryVertically;

@end
