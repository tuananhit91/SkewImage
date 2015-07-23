//
//  ViewController.m
//  SkewImage
//
//  Created by admin on 7/23/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iPhoto;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation ViewController
NSTimer* _timer;
- (void)viewDidLoad {
    [super viewDidLoad];
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.05
                                              target:self
                                            selector:@selector(onTimer)
                                            userInfo:nil
                                             repeats:YES];
    
    self.slider.tintColor = [UIColor orangeColor];
    self.slider.thumbTintColor = [UIColor blueColor];
}

- (void)onTimer{
    self.slider.value += 0.01;
    if (self.slider.value == 1) {
        self.slider.value = 0;
    }else if((0<self.slider.value) && (self.slider.value < 0.5)){
        CATransform3D t = CATransform3DIdentity;
        t.m34 = -0.001;
        t = CATransform3DRotate(t, M_PI / (0.3 + self.slider.value), 0.0, 1.0, 0.0);
        self.iPhoto.layer.transform = t;
    }else{
        CATransform3D t = CATransform3DIdentity;
        t.m34 = -0.001;
        t = CATransform3DRotate(t, M_PI / -(self.slider.value), 0.0, 1.0, 0.0);
        self.iPhoto.layer.transform = t;
    }
}

- (IBAction)ONOFFSlider:(id)sender {
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }else{
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                  target:self
                                                selector:@selector(onTimer)
                                                userInfo:nil
                                                 repeats:YES];
    }
}

- (IBAction)actionSlider:(id)sender {
    if((0<self.slider.value) && (self.slider.value < 0.5)){
        CATransform3D t = CATransform3DIdentity;
        t.m34 = -0.001;
        t = CATransform3DRotate(t, M_PI / (0.3 + self.slider.value), 0.0, 1.0, 0.0);
        self.iPhoto.layer.transform = t;
    }else{
        CATransform3D t = CATransform3DIdentity;
        t.m34 = -0.001;
        t = CATransform3DRotate(t, M_PI / -(self.slider.value), 0.0, 1.0, 0.0);
        self.iPhoto.layer.transform = t;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
