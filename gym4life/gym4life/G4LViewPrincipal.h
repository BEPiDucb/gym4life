//
//  G4LViewPrincipal.h
//  gym4life
//
//  Created by willie santos on 29/05/14.
//  Copyright (c) 2014 willie santos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "G4LSerieCell.h"

@interface G4LViewPrincipal : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) NSMutableArray *seriesArray;
@property (weak, nonatomic) IBOutlet UISwitch *notificacaoBotao;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *labelNotificacao;

@end
