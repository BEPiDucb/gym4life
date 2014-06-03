//
//  G4LViewPrincipal.m
//  gym4life
//
//  Created by willie santos on 29/05/14.
//  Copyright (c) 2014 willie santos. All rights reserved.
//

#import "G4LViewPrincipal.h"
#import "G4LViewControllerSerie.h"
@interface G4LViewPrincipal ()

@end

//Apagar esse metodo com o botao
@implementation G4LViewPrincipal
- (IBAction)chamarSerie:(id)sender
{
    G4LViewControllerSerie *serieJanela=[[G4LViewControllerSerie alloc]init];
    serieJanela.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    
    [self presentViewController:serieJanela animated:YES completion:nil];
    
    
    
}

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
    
    //chamando o metodo sem lugar definido
    [self carregarPlistsNoiPhone];
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//procurar um lugar para esse metodo
-(void) carregarPlistsNoiPhone
{

    //Recuperando os plists do iphone
      NSMutableArray *seriesPlist=
      [[NSMutableArray alloc]
                            initWithContentsOfFile:
                                [[NSBundle mainBundle] pathForResource:@"series" ofType:@"plist"]];
    
    
    
    //Teste de criacao de uma serie com um exercicio
    NSMutableArray *serie_01=[[NSMutableArray alloc] init];
    NSMutableDictionary *exercicio_01=[[NSMutableDictionary alloc] init];
    
    [exercicio_01 setObject:@"alogamento do pescoço" forKey:@"nome"];
    [exercicio_01 setObject:@"coracao_botao.png" forKey:@"nomeImg"];
    
    
    
    [serie_01 addObject:exercicio_01];
    [seriesPlist addObject:serie_01];
    
    
    
    
    //Gravando a serie no iphone
    [seriesPlist writeToFile:
                            [[NSBundle mainBundle] pathForResource:@"series" ofType:@"plist"]
                                                    atomically:YES];
    
    
    //apagar isso
    NSLog(@"%@",seriesPlist);
    
}

@end
