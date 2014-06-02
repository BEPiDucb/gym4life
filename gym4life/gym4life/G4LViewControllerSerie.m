//
//  G4LViewControllerSerie.m
//  gym4life
//
//  Created by Ramon Cruz  on 6/2/14.
//  Copyright (c) 2014 willie santos. All rights reserved.
//

#import "G4LViewControllerSerie.h"

@interface G4LViewControllerSerie ()

@end

@implementation G4LViewControllerSerie
- (IBAction)seriesBotao:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)img_favoritar:(id)sender {
    
    NSLog(@"Favoritado!");


}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
