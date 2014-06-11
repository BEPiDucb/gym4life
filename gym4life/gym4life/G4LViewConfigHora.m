//
//  G4LViewConfigHora.m
//  gym4life
//
//  Created by willie santos on 04/06/14.
//  Copyright (c) 2014 willie santos. All rights reserved.
//

#import "G4LViewConfigHora.h"

@interface G4LViewConfigHora ()

@end

@implementation G4LViewConfigHora

static G4LViewConfigHora *defaultHora=nil;


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

- (IBAction)voltarViewConfig:(id)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    
    self.str = [dateFormatter stringFromDate:self.horario.date];
    
    [[G4LViewConfigHora defaultHora] setHorario:_horario];
    [self dismissViewControllerAnimated:YES completion:nil];
}

+(G4LViewConfigHora *)defaultHora
{
    if (defaultHora==nil)
        defaultHora = [[G4LViewConfigHora alloc]init];
    
    return  defaultHora;
}
@end
