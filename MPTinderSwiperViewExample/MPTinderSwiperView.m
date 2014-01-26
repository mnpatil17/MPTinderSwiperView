//
//  MPTinderSwiperView.m
//
//
//  Arranged and abstracted by Mihir Patil on 1/25/14.
//  Original Implementation by Rex Fatahi.

#import "MPTinderSwiperView.h"

@implementation MPTinderSwiperView

#pragma mark - Variable Synthesis

@synthesize pgr;
@synthesize swipeTransform;
@synthesize originalCenterXCoord;
@synthesize originalCenterYCoord;
@synthesize shouldMoveHorizontally;
@synthesize shouldMoveVertically;

#pragma mark - Constants

const float TRANSLATE_BY = 1.50;

#pragma mark - Initialization

- (id)initWithSuperView:(UIView *)superView andFrame:(CGRect)frame andShouldMoveHorizontally:(BOOL)shouldMoveHorizontallyParam andShouldMoveVertically:(BOOL)shouldMoveVerticallyParam andBackgroundColor:(UIColor *)backgroundColor
{
    self = [super initWithFrame:frame];
    if (self) {
        self.superview.userInteractionEnabled = YES;
        self.userInteractionEnabled = YES;
        self.layer.shouldRasterize = YES;
        [self setBackgroundColor:backgroundColor];
        pgr = [[UIPanGestureRecognizer alloc]
               initWithTarget:self action:@selector(handlePan:)];
        pgr.delegate = self;
        [self addGestureRecognizer:pgr];
        
        /** Initializing Class Properties **/
        self.originalCenterXCoord = self.center.x;
        self.originalCenterYCoord = self.center.y;
        self.shouldMoveHorizontally = shouldMoveHorizontallyParam;
        self.shouldMoveVertically = shouldMoveVerticallyParam;
        
    }
    return self;
}

#pragma mark - Handling Panning

- (void)handlePan:(UIPanGestureRecognizer *)recognizer{
    CGPoint translation = [recognizer translationInView:self.superview];
    
    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{[recognizer.view setCenter:(CGPointMake(recognizer.view.center.x+translation.x * [self shouldMoveHorizontally],recognizer.view.center.y +translation.y * [self shouldMoveVertically]))];} completion:nil];
    
    CGPoint leftOutOfBounds = CGPointMake(-160, 160);
    CGPoint rightOutOfBounds = CGPointMake(480, 160);
    
    CGPoint velocity = [recognizer velocityInView:self];
    
    if(self.center.x > self.superview.center.x){
        
        if(velocity.x > 0){
            swipeTransform = swipeTransform+.0099;
        }
        else if (velocity.x < 0){
            swipeTransform = swipeTransform-.0099;
        }
        [self setTransform:CGAffineTransformMakeRotation(swipeTransform)];
    }
    else if(self.center.x < self.superview.center.x){
        if(velocity.x < 0){
            swipeTransform = swipeTransform-.0099;
        }
        else if(velocity.x > 0){
            swipeTransform = swipeTransform+.0099;
        }
        [self setTransform:CGAffineTransformMakeRotation(swipeTransform)];
    }
    
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.superview];
    
    if (recognizer.state == UIGestureRecognizerStateEnded){
        if (self.center.x < 50) {               /** INDICATES A SWIPE TO THE LEFT **/
            [UIView animateWithDuration:.25 animations:^{self.center = leftOutOfBounds;
            } completion:^(BOOL isFinished){
                if (isFinished == true) {
                    self.hidden = YES;
                }
            }];
        }
        else if (self.center.x > 270) {         /** INDICATES A SWIPE TO THE RIGHT **/
            [UIView animateWithDuration:.25 animations:^{self.center = rightOutOfBounds;             } completion:^(BOOL isFinished){
                if (isFinished == true) {
                    self.hidden = YES;
                }
            }];
        }
        else {
            [self resetViewToOriginalPositionWithRecognizer:recognizer];
        }
    }
}

- (void) resetViewToOriginalPositionWithRecognizer:(UIGestureRecognizer *)recognizer
{
    [UIView animateWithDuration:.3 animations:^{
        self.center = self.center;
        [self setTransform:CGAffineTransformMakeRotation(0.0)]; swipeTransform = 0;
        [recognizer.view setCenter:(CGPointMake(originalCenterXCoord,originalCenterYCoord))];
    }   completion:^(BOOL isFinished){}];
}

- (float) amountToVaryHorizontally
{
    return shouldMoveHorizontally ? 1.50 : 0.00;
}

- (float) amountToVaryVertically
{
    return shouldMoveVertically ? 1.50 : 0.00;
}


@end
