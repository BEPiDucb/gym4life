//
//  G4LViewPrincipal.m
//  gym4life
//
//  Created by willie santos on 29/05/14.
//  Copyright (c) 2014 willie santos. All rights reserved.
//

#import "G4LViewPrincipal.h"
#import "G4LViewConfig.h"
@interface G4LViewPrincipal ()

@end

@implementation G4LViewPrincipal
//apagar esse metodo
- (IBAction)testaConfigPlist:(id)sender
{
    NSArray *configPlist=[[NSArray alloc] initWithContentsOfFile:
    [[NSBundle mainBundle] pathForResource:@"configuracoes" ofType:@"plist"]];
    
    NSLog(@"Config plist %@",configPlist);
    
}

- (IBAction)chamaConfig:(id)sender {
    
    G4LViewConfig *viewConfig=[[G4LViewConfig alloc] init];
    
    viewConfig.modalTransitionStyle=UIModalPresentationFullScreen;
    
    [self presentViewController:viewConfig animated:YES completion:nil];
    
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
