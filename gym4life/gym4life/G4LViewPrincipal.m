//
//  G4LViewPrincipal.m
//  gym4life
//
//  Created by willie santos on 29/05/14.
//  Copyright (c) 2014 willie santos. All rights reserved.
//

#import "G4LViewPrincipal.h"
#import "G4LViewControllerSerie.h"
@interface G4LViewPrincipal ()

@end

//Apagar esse metodo com o botao
@implementation G4LViewPrincipal
- (IBAction)chamarSerie:(id)sender
{
    G4LViewControllerSerie *serieJanela=[[G4LViewControllerSerie alloc]init];
    serieJanela.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    
    [self presentViewController:serieJanela animated:YES completion:nil];
    
    
    
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
