//
//  PaintableImageView.m
//  PaintingSample
//
//  Created by Adam Wulf on 9/9/12.
//
//

#import "PaintableImageView.h"

@implementation PaintableImageView

- (id)initWithImage:(UIImage *)image
{
    self = [super initWithImage:image];
    if (self) {
        // Initialization code
        paint = [[PaintView alloc] initWithFrame:self.bounds];
        [self addSubview:paint];
        
        UIPanGestureRecognizer* pan = [[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragging:)] autorelease];
        [self addGestureRecognizer:pan];
        
        self.userInteractionEnabled = YES;
    }
    return self;
}


#pragma mark - PaintTouchViewDelegate

-(void) drawArcAtStart:(CGPoint)point1 end:(CGPoint)point2 controlPoint1:(CGPoint)ctrl1 controlPoint2:(CGPoint)ctrl2 withFingerWidth:(CGFloat)fingerWidth fromView:(UIView *)view{
    [paint drawArcAtStart:point1 end:point2 controlPoint1:ctrl1 controlPoint2:ctrl2 withFingerWidth:fingerWidth fromView:view];
}

-(void) drawDotAtPoint:(CGPoint)point withFingerWidth:(CGFloat)fingerWidth fromView:(UIView *)view{
    [paint drawDotAtPoint:point withFingerWidth:fingerWidth fromView:view];
}

-(void) drawLineAtStart:(CGPoint)start end:(CGPoint)end withFingerWidth:(CGFloat)fingerWidth fromView:(UIView *)view{
    [paint drawLineAtStart:start end:end withFingerWidth:fingerWidth fromView:view];
}




-(void)dragging:(UIPanGestureRecognizer *)gesture
{
    if(gesture.state == UIGestureRecognizerStateBegan)
    {
        //NSLog(@"Received a pan gesture");
        panCoord = [gesture locationInView:gesture.view];
        
        
    }
    CGPoint newCoord = [gesture locationInView:gesture.view];
    float dX = newCoord.x-panCoord.x;
    float dY = newCoord.y-panCoord.y;
    
    gesture.view.center = CGPointMake(gesture.view.center.x + dX, gesture.view.center.y + dY);
}
@end
