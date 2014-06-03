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
    [self carregarSeriesPlist];
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//procurar um lugar para esse metodo
-(void) carregarSeriesPlist
{
    //pegando endereco interno do applicativo
    NSString *enderecoResource =[[NSBundle mainBundle] resourcePath];
    NSFileManager *fileManager=[NSFileManager defaultManager];
    NSMutableArray *plist=[[NSMutableArray alloc]init];
    
    NSArray *conteudoNoDiretorio=[fileManager contentsOfDirectoryAtPath:enderecoResource error:nil];
    
    //selecionando somente os arquivos plist
    [conteudoNoDiretorio enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
     {
         NSString *nomeArquivo= (NSString *) obj;
         NSString *extencaoArquivo =[[nomeArquivo pathExtension] lowercaseString];
         
         if ([extencaoArquivo isEqualToString:@"plist"])
         {
             [plist addObject:nomeArquivo];
         }
    }];
    
    //verifico se o arquivo series.plist existe
    int exite=0;
    for (int i=0 ; i<[plist count];i++)
    {
        if ([[plist objectAtIndex:i] isEqualToString:@"serie.plist" ])
        {
            NSLog(@"Exites");
            exite=1;
            break;
            
        }else exite=0;
        
    }
    
    //se nao existir crio o plist
    if (exite==0)
    {
        
    }
    
}

@end
