//
//  ViewController.m
//  MinorityReport
//
//  Created by Rockstar. on 3/12/15.
//  Copyright (c) 2015 Fantastik. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *theFutureLabel;
@property (weak, nonatomic) IBOutlet UILabel *thePrecogsLabel;
@property CGPoint originalCenter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.originalCenter = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height /2 - self.thePrecogsLabel.frame.size.height);
    // Do any additional setup after loading the view, typically from a nib.
}



- (IBAction)panHandlerRecognizer:(UIPanGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {

        [UIView animateWithDuration:1.0 animations:^{
            self.theFutureLabel.center = self.originalCenter;
        }];
    } else {
        CGPoint point = [gestureRecognizer locationInView:self.view];
        //Give location to a view to contextualize the gesture
        self.theFutureLabel.center = point;

        if (CGRectContainsPoint(self.thePrecogsLabel.frame, point)) {
            self.theFutureLabel.backgroundColor = [UIColor redColor];
            self.theFutureLabel.text = @"A fictitious and Incriminating Future";
            [self.theFutureLabel sizeToFit];
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
