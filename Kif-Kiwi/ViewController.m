//
//  ViewController.m
//  Kif-Kiwi
//
//  Created by Jim Lien on 1/22/15.
//  Copyright (c) 2015 midasmobile. All rights reserved.
//

#import "ViewController.h"
#import "SampleWebService.h"

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
    [SampleWebService get:@"path" handler:^(id obj, NSError *error) {
        if (error) {
            [[[UIAlertView alloc] initWithTitle:@"Title" message:@"Error occurred" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        } else {
            NSData *data = obj;
            _hereLabel.text = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            _hereLabel.hidden = NO;
        }
    }];
}

@end
