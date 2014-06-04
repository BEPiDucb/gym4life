//
//  G4LViewSerie.h
//  gym4life
//
//  Created by Júlio Menezes Noronha on 04/06/14.
//  Copyright (c) 2014 willie santos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface G4LViewSerie : UIViewController
{
 
    NSTimer *cronometro;
    int contador,numSerie,exercicio,qtdExercicios;
    
}

@property (nonatomic) IBOutlet UILabel *serieLabel;
@property (nonatomic) IBOutlet UILabel *exercicioLabel;
@property (nonatomic) IBOutlet UILabel *cronometroLabel;

-(id)initWithSerie:(int)serie andQtdExercicios:(int)numExercicios;
-(void)ContadorCronometro;

@end
