//
//  G4LViewControllerSerie.m
//  gym4life
//
//  Created by Ramon Cruz  on 6/2/14.
//  Copyright (c) 2014 willie santos. All rights reserved.
//

#import "G4LViewControllerSerie.h"
#import "G4LSeries.h"
#import "G4LExercicio.h"

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
    
    G4LSeries *serieEscolhida=[G4LSeries serieEscolhida];
    G4LExercicio *exercicio;
    
    CGRect imageViewFrame;
    CGRect labelOrientacaoFrame;

    UIImageView *imageViewExercicio ;
    UILabel *labelOrientacao;
    
    
    
    for (int i=0; i<[[serieEscolhida exercicios] count]; i++)
    {
    
        exercicio= [[serieEscolhida exercicios] objectAtIndex:0];
    
        
        imageViewFrame = CGRectMake(0.f, 0.f,240.f,240.f);
        labelOrientacaoFrame =CGRectMake(0.f, 240.f, 240.f, 70.f);
        
        imageViewFrame.origin.x=_scrollView.frame.size.width*i;
        labelOrientacaoFrame.origin.x=_scrollView.frame.size.width*i;
    
        imageViewExercicio = [[UIImageView alloc] initWithFrame:imageViewFrame];
        labelOrientacao=[[UILabel alloc ]initWithFrame:labelOrientacaoFrame];
    
        
        [imageViewExercicio setImage:[UIImage imageNamed:[[exercicio imagens] objectAtIndex:i]]];
        
        [imageViewExercicio setContentMode:UIViewContentModeScaleToFill];
        
        labelOrientacao.text=[[exercicio orientacao] objectAtIndex:i];
        labelOrientacao.textAlignment=NSTextAlignmentCenter;
        
        _ExercicioNome.text=[exercicio nome];
        [_scrollView addSubview:imageViewExercicio];
        [_scrollView addSubview:labelOrientacao];
    
    }//fim for
    
    _scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * [[serieEscolhida exercicios]count], self.scrollView.frame.size.height);

    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
