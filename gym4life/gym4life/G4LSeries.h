//
//  G4LSeries.h
//  gym4life
//
//  Created by willie santos on 29/05/14.
//  Copyright (c) 2014 willie santos. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface G4LSeries : NSObject{

}

@property (nonatomic) NSString *nome;
@property (nonatomic) NSMutableArray *exercicios;
@property (nonatomic) int numSerie;

+(G4LSeries *) serieEscolhida;
@end
