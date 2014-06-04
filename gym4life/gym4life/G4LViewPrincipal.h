//
//  G4LViewPrincipal.h
//  gym4life
//
//  Created by willie santos on 29/05/14.
//  Copyright (c) 2014 willie santos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface G4LViewPrincipal : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) NSMutableArray *seriesArray;

@end
