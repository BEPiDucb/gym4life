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


+(G4LSeries *)serieEscolhida
{
    NSArray *seriesPlist=[[NSArray alloc] initWithContentsOfFile:
    [[NSBundle mainBundle] pathForResource: @"series" ofType:@"plist" ]
    ];
    
    int indexSerieEscolhida=0;
    
    
    if (serieEscolhida==nil)
    {
        indexSerieEscolhida=[[seriesPlist lastObject] intValue];
        serieEscolhida =[[G4LSeries alloc]init];
        serieEscolhida.exercicios=[G4LExercicio exerciciosSerie:indexSerieEscolhida];
        
    }
    return serieEscolhida;
}
-(void)carregarSerie
{
    //Recupero o seriesPlist
    NSArray *seriesPlist = [[NSBundle mainBundle] pathForResource:@"series" ofType:@"plist"];
    
    
}
@end
