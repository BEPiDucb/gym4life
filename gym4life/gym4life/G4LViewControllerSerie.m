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
    
    NSMutableArray *series=[[NSMutableArray alloc]
                initWithContentsOfFile:[
                                        [NSBundle mainBundle] pathForResource:@"series" ofType:@"plist"]
                                        ];
    
    
    // essa parte será dinamica
    CGRect imageViewFrame;
    CGRect labelOrientacaoFrame;
    
    
    imageViewFrame = CGRectMake(0.f, 0.f,240.f,300.f);
    labelOrientacaoFrame =CGRectMake(0.f, 240.f, 240.f, 70.f);
    
    UIImageView *imageViewExercicio = [[UIImageView alloc] initWithFrame:imageViewFrame];
    UILabel *labelOrientacao=[[UILabel alloc ]initWithFrame:labelOrientacaoFrame];
    
    imageViewExercicio.backgroundColor =[UIColor blackColor];
    labelOrientacao.backgroundColor =[UIColor yellowColor];
    
    
  // Nome da foto guardado no series.plist
  //  NSString *nomeFoto= [[series[1] objectAtIndex:0]objectForKey:@"nomeImg"];
  //  [imageViewExercicio setImage:[UIImage imageNamed:nomeFoto]];
    
    [_scrollView addSubview:imageViewExercicio];
    [_scrollView addSubview:labelOrientacao];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
