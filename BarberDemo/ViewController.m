//
//  ViewController.m
//  Barber
//
//  Created by laizw on 2017/9/22.
//  Copyright © 2017年 laizw. All rights reserved.
//

#import "ViewController.h"
#import "Barber.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)flatTop:(id)sender {
    [Barber.Tony cut:HairTypeFlatTop];
}
- (IBAction)roundface:(id)sender {
    [Barber.Tony cut:HairTypeRoundFace];
}
- (IBAction)reset:(id)sender {
    [Barber.Tony cut:HairTypeDefault];
}

@end
