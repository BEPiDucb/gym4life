//
//  G4LExercicio.m
//  gym4life
//
//  Created by willie santos on 29/05/14.
//  Copyright (c) 2014 willie santos. All rights reserved.
//

#import "G4LExercicio.h"

@implementation G4LExercicio


+(NSMutableArray *)exerciciosSerie:(int)indexSerie
{
    NSMutableArray *exerciciosDaSerie =[[NSMutableArray alloc]init ];
    
    //Recupera os dados de series.plist
    NSArray *seriesPlist=[[NSArray alloc] initWithContentsOfFile:
    [[NSBundle mainBundle] pathForResource:@"series" ofType:@"plist"]];
    
    NSArray *exerciciosNaSerie=[seriesPlist objectAtIndex:indexSerie];
    
    NSDictionary *exerciciosDictionary;
    G4LExercicio *exercicio;
    NSMutableArray *imagensDoExercicio;
    UIImage *imagem;

  for (int i=0; i<[exerciciosNaSerie count]; i++)
    {
        
        exerciciosDictionary =[exerciciosNaSerie objectAtIndex:i];
        exercicio=[[G4LExercicio alloc]init];
        imagensDoExercicio =[[NSMutableArray alloc]init];
       for (NSString *conteudo in [exerciciosDictionary objectForKey:@"imagens"])
       {
           [imagensDoExercicio addObject:[UIImage imageNamed:conteudo]];
           imagem=[[UIImage alloc]init];
        
       }
       
        [exercicio setOrientacao: [exerciciosDictionary objectForKey:@"orientacao"]];
        [exercicio setImagens:imagensDoExercicio];
        [exercicio setNome:[exerciciosDictionary objectForKey:@"nome"]];
        
        [exerciciosDaSerie addObject:exercicio];
       

    }
    
   // NSLog(@"[Classe Exercicio]%@",exerciciosNaSerie);
    
    return exerciciosDaSerie;
}

@end
