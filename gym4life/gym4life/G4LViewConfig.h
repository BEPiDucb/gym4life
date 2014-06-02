//
//  G4LViewConfig.h
//  viewConfiguracao
//
//  Created by willie santos on 02/06/14.
//  Copyright (c) 2014 willie santos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface G4LViewConfig : UIViewController{
    
}
@property (nonatomic)NSString * segunda;
@property (nonatomic)NSString * terca;
@property (nonatomic)NSString * quarta;
@property (nonatomic)NSString * quinta;
@property (nonatomic)NSString * sexta;
@property (nonatomic)NSString * sabado;
@property (nonatomic)NSString * domingo;

- (IBAction)switcSegunda:(id)sender;
- (IBAction)switcTerca:(id)sender;
- (IBAction)switcQuarta:(id)sender;
- (IBAction)switcQuinta:(id)sender;
- (IBAction)switcSexta:(id)sender;
- (IBAction)switcSabado:(id)sender;
- (IBAction)switcDomingo:(id)sender;
- (IBAction)Salvar:(id)sender;

@end
