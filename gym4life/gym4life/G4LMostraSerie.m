//
//  G4LMostraSerie.m
//  gym4life
//
//  Created by Júlio Menezes Noronha on 05/06/14.
//  Copyright (c) 2014 willie santos. All rights reserved.
//

#import "G4LMostraSerie.h"

@interface G4LMostraSerie ()

@end

@implementation G4LMostraSerie

@synthesize scrollView,pageControl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    pageControlBeingUsed = NO;
    _seriesVoltar.alpha=1;
    
    //Array para teste, aloca três cores
    NSMutableArray *cores = [[NSMutableArray alloc]init];
    
    [cores addObject:[UIColor redColor]];
    [cores addObject:[UIColor greenColor]];
    [cores addObject:[UIColor blueColor]];
    [cores addObject:[UIColor yellowColor]];
    [cores addObject:[UIColor purpleColor]];
    [cores addObject:[UIColor cyanColor]];
    
    //Esse for cria um frame para cada cor e o posiciona na scrollview
    for(int i=0; i<cores.count; i++)
    {
        CGRect frame;
        
        frame.origin.x = self.scrollView.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self.scrollView.frame.size;
        
        UIView *subView = [[UIView alloc]initWithFrame:frame];
        subView.backgroundColor = [cores objectAtIndex:i];
        
        [self.scrollView addSubview:subView];
        
        subView = nil;
        
    }
    
    //Habilita a paginação
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    
    //Define o tamanho do conteúdo
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * cores.count, self.scrollView.frame.size.height);
    
    //Faz o pageControl iniciar na primeira página, já que a view acabou de ser carregada.
    self.pageControl.currentPage = 0;
    
    //Define o número de páginas do pageControl
    self.pageControl.numberOfPages = cores.count;
    
}

//Método chamado se a scrollview sofreu a açao de scroll
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //Se não foi clicado no pageControl
    if(!pageControlBeingUsed){
        
        //Define a largura da página
        CGFloat pageWidth = self.scrollView.frame.size.width;
        
        //Um cálculo para definir o número da página
        int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        
        //Define a posição da bolinha branca do pageControl
        self.pageControl.currentPage = page;
        
    }
    
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    pageControlBeingUsed = NO;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    pageControlBeingUsed = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Método chamado quando o usuário clica no pageControl
- (IBAction)PaginaMudada:(id)sender {
    
    CGRect frame;
    
    frame.origin.x = self.scrollView.frame.size.width * self.pageControl.currentPage;
    frame.origin.y = 0;
    frame.size = self.scrollView.frame.size;
    [self.scrollView scrollRectToVisible:frame animated:YES];
    
    pageControlBeingUsed = YES;
}


@end
