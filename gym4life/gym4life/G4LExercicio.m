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
    
    NSArray *seriesPlist=[[NSBundle mainBundle] pathForResource:@"series" ofType:@"plist"];
    
    
    return exerciciosDaSerie;
}

@end
