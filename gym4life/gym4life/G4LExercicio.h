//
//  G4LExercicio.h
//  gym4life
//
//  Created by willie santos on 29/05/14.
//  Copyright (c) 2014 willie santos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface G4LExercicio : NSObject{
    
}
@property (nonatomic,readonly) NSString *nome;
@property (nonatomic,readonly) NSString *articulacao;
@property (nonatomic,readonly) NSString *grupoMuscular;
@property (nonatomic,readonly) NSString *imagemNome;

-(NSMutableArray *) carregaExercicio;

@end
