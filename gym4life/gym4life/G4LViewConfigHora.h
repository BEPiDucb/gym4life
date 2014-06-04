//
//  G4LViewConfigHora.h
//  gym4life
//
//  Created by willie santos on 04/06/14.
//  Copyright (c) 2014 willie santos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface G4LViewConfigHora : UIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *horario;
@property (nonatomic) NSString * str;

- (IBAction)voltarViewConfig:(id)sender;
+(G4LViewConfigHora*) defaultHora;

@end
