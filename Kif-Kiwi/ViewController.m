//
//  ViewController.m
//  Kif-Kiwi
//
//  Created by Jim Lien on 1/22/15.
//  Copyright (c) 2015 midasmobile. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UILabel *hereLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)btnTapped:(id)sender
{
    _hereLabel.hidden = NO;
}

@end
