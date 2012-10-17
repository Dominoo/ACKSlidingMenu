//
//  ViewController.m
//  ACKSlidingMenu
//
//  Created by Dominik Vesely on 10/16/12.
//  Copyright (c) 2012 Dominik Vesely. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize menu = _menu;

- (void)loadView {
    
    [super loadView];
    self.view.backgroundColor = [UIColor redColor];
  _menu = [[ACKSlidingMenu alloc] initWithParent:self.view];
    [_menu addButton:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search.png"]] withTarget:self andAction:@selector(aa)];
     [_menu addButton:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search.png"]] withTarget:self andAction:@selector(aa)];

    
}
     
- (void) aa {
     NSLog(@"Test");
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
