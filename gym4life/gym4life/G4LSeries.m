//
//  G4LSeries.m
//  gym4life
//
//  Created by willie santos on 29/05/14.
//  Copyright (c) 2014 willie santos. All rights reserved.
//

#import "G4LSeries.h"
#import "G4LExercicio.h"
@implementation G4LSeries

static G4LSeries *serieEscolhida=nil;
static int indexSerieClicada=0;
static int indexSerieEscolhida=0;

+(G4LSeries *)serieEscolhida
{
    NSArray *seriesPlist=[[NSArray alloc] initWithContentsOfFile:
    [[NSBundle mainBundle] pathForResource: @"series" ofType:@"plist" ]
    ];
    
    int indexSerieEscolhida = 0;
    
    
    if (serieEscolhida==nil)
    {
        indexSerieEscolhida = [[seriesPlist lastObject] intValue];
        serieEscolhida = [[G4LSeries alloc]init];
        serieEscolhida.exercicios = [G4LExercicio exerciciosSerie:indexSerieEscolhida];
        
    }
    return serieEscolhida;
}
-(void)carregarSerie
{
    //Recupero o seriesPlist
    NSArray *seriesPlist = [[NSBundle mainBundle] pathForResource:@"series" ofType:@"plist"];
    
    
}
/*
    Carrega exercicios com a passagem do index da serie
 */
+(void)setNumSerie:(int)nroSerie
{
    serieEscolhida.exercicios = [G4LExercicio exerciciosSerie:nroSerie];
}


+(void)setSerieClicada:(int)indexSerie
{
    indexSerieClicada=indexSerie;
}
+(int)serieClicada
{
    return indexSerieClicada;
}

+(int)indexSerieEscolhida
{
    return indexSerieEscolhida;
}
+(void)setIndexSerieEscolhida:(int)indexSerie
{
    indexSerieEscolhida=indexSerie;
}
@end
