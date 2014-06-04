//
//  G4LViewSerie.m
//  gym4life
//
//  Created by Júlio Menezes Noronha on 04/06/14.
//  Copyright (c) 2014 willie santos. All rights reserved.
//

#import "G4LViewSerie.h"

@interface G4LViewSerie ()

@end

@implementation G4LViewSerie

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithSerie:(int)serie andQtdExercicios:(int)numExercicios
{
    self = [super init];
    if (self) {
        numSerie = serie;
        qtdExercicios = numExercicios;
        exercicio = 1;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _serieLabel.text = [NSString stringWithFormat:@"Serie %d",numSerie];
    _exercicioLabel.text = [NSString stringWithFormat:@"Exercicio %d",exercicio];
    
    //Seta o contador geral para um valor assim que a view é carregada
    contador = 5;
    
    cronometro =
    [NSTimer
     scheduledTimerWithTimeInterval:1          //A cada X segundos (no caso 1)
     target:self                               //Para um alvo (o próprio cronomero)
     selector:@selector(ContadorCronometro)    //Chama um seletor (no caso o método ContadorCronometro
     userInfo:nil                              //Não sei pra que serve =3
     repeats:YES];                             //Se repete
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)ContadorCronometro
{
    
    //Assim que chamado, decrementa o contador geral
    contador --;
    
    //Quando o contador for menor que 0
    if(contador < 0){
        
        //Incrementa o número do exercício
        exercicio++;
        
        //Quando acabar os exercícios
        if(exercicio > qtdExercicios){
    
            //Retira a view
            [self dismissViewControllerAnimated:YES completion:nil];
            
        }else{
            
            //Imprime o valor do exercício
            _exercicioLabel.text = [NSString stringWithFormat:@"Exercicio %d",exercicio];
            
            //Reseta o contador geral
            contador = 5;
            
            //Imprime o valor do cronometro
            _cronometroLabel.text = [NSString stringWithFormat:@"00:%02d",contador];
        }
    }else{
        //Imprime o valor do cronometro
        _cronometroLabel.text = [NSString stringWithFormat:@"00:%02d",contador];
    }
}

@end
