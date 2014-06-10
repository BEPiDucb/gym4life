//
//  G4LMostraSerie.h
//  gym4life
//
//  Created by Júlio Menezes Noronha on 05/06/14.
//  Copyright (c) 2014 willie santos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface G4LMostraSerie : UIViewController <UIScrollViewDelegate>
{
    //Flag para saber se o pageControl está sendo usado
    BOOL pageControlBeingUsed;
}
@property (nonatomic,retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic,retain) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIButton *seriesVoltar;

@end
