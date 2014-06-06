//
//  G4LViewControllerSerie.h
//  gym4life
//
//  Created by Ramon Cruz  on 6/2/14.
//  Copyright (c) 2014 willie santos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface G4LViewControllerSerie : UIViewController <UIScrollViewDelegate>

{
    //Flag para saber se o pageControl está sendo usado
    BOOL pageControlBeingUsed;
}

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *ExercicioNome;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;


@end
