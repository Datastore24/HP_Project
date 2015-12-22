//
//  ViewController.m
//  HappyParents
//
//  Created by Кирилл Ковыршин on 19.12.15.
//  Copyright © 2015 datastore24. All rights reserved.
//

#import "StartViewController.h"
#import "ABCIntroView.h"

@interface StartViewController () <ABCIntroViewDelegate>
@property ABCIntroView *introView;

@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults objectForKey:@"intro_screen_viewed"]) {
        self.introView = [[ABCIntroView alloc] initWithFrame:self.view.frame];
        
        self.introView.delegate = self;
        self.introView.backgroundColor = [UIColor colorWithWhite:0.149 alpha:1.000];
        [self.view addSubview:self.introView];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - ABCIntroViewDelegate Methods

-(void)onDoneButtonPressed{
    
    //    Uncomment so that the IntroView does not show after the user clicks "DONE"
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:@"YES"forKey:@"intro_screen_viewed"];
        [defaults synchronize];
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.introView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.introView removeFromSuperview];
    }];
}

@end
