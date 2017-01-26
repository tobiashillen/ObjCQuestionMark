//
//  ViewController.m
//  QuestionMark
//
//  Created by Tobias Hillén on 2017-01-26.
//  Copyright © 2017 Tobias Hillén. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) UILabel *questionMark;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.questionMark = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    self.questionMark.center = self.view.center;
    self.questionMark.text = @"?";
    self.questionMark.font = [UIFont systemFontOfSize:36];
    self.questionMark.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.questionMark];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    
    [self.view addGestureRecognizer:tapGestureRecognizer];

}

- (void) tap:(UITapGestureRecognizer*)regognizer {
    CGPoint tapPosition = [regognizer locationInView:self.view];
    self.questionMark.center = tapPosition;
}
- (float)randomFloat {
    return (arc4random() / (float)UINT_MAX);
}

- (IBAction)swipe:(UISwipeGestureRecognizer *)sender {
    self.questionMark.textColor = [UIColor colorWithRed:[self randomFloat] green:[self randomFloat] blue:[self randomFloat] alpha:1.0];
}
- (IBAction)pinch:(UIPinchGestureRecognizer *)sender {
    CGAffineTransform newScale = CGAffineTransformScale(self.questionMark.transform, sender.scale, sender.scale);
    self.questionMark.transform = newScale;
    sender.scale = 1;
}

- (IBAction)rotation:(UIRotationGestureRecognizer *)sender {
    CGAffineTransform newRotation = CGAffineTransformRotate(self.questionMark.transform, sender.rotation);
    self.questionMark.transform = newRotation;
    sender.rotation = 0.0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
