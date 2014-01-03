//
//  ViewController.m
//  p91
//
//  Created by SDT-1 on 2014. 1. 3..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UISlider *sl1;
@property (weak, nonatomic) IBOutlet UISlider *sl2;
@property (weak, nonatomic) IBOutlet UISlider *sl3;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indi;

@end

@implementation ViewController
- (IBAction)sliderChanged:(id)sender {
    if([_indi isAnimating]){
        [_indi stopAnimating];
    }
    
    _view1.backgroundColor=[UIColor colorWithRed:_sl1.value green:_sl2.value blue:_sl3.value alpha:1];
}
- (IBAction)power:(id)sender {
    BOOL isOn = ((UISwitch *)sender).on;
    _sl1.enabled = isOn;
    _sl2.enabled = isOn;
    _sl3.enabled = isOn;
    
    if(isOn)
    {
        [_indi startAnimating];
        [self performSelector:@selector(sliderChanged:) withObject:nil afterDelay:1.0];
        
    }
    else{
        self.view1.backgroundColor=[UIColor grayColor];
    }
    
}
-(void) viewWillAppear:(BOOL)animated{
    [self sliderChanged:nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
