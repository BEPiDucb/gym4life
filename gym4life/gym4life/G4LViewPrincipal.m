//
//  G4LViewPrincipal.m
//  gym4life
//
//  Created by willie santos on 29/05/14.
//  Copyright (c) 2014 willie santos. All rights reserved.
//

#import "G4LViewPrincipal.h"
#import "G4LViewControllerSerie.h"
#import "G4LSeries.h"
#import "G4LExercicio.h"
#import "G4LMostraSerie.h"

@interface G4LViewPrincipal ()

@end

@implementation G4LViewPrincipal

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
    // Do any additional setup after loading the view from its nib.
   //Carrega arquivos plists no iphone 
    [self carregarDadosNoiPhone];
    
    
    //Aloca o array series
    _seriesArray = [[NSMutableArray alloc]init];
    
    NSArray *seriesPlist=[[NSArray alloc] initWithContentsOfFile:
                          [[NSBundle mainBundle] pathForResource:@"series" ofType:@"plist"]];

    
    // Preenche o array com 30 series vazias, apenas para demonstração e teste,
    // devendo ser mudado para alocar em vez de strings, alocar arrays de exercícios
    for(int i=0;i<seriesPlist.count - 1;i++){
        [_seriesArray addObject:[NSString stringWithFormat:@"Serie %d",i]];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

    
//Método requerido pelo protocolo
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_seriesArray count];
}


//Outro método requerido pelo protocolo
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [_seriesArray objectAtIndex:indexPath.row];
    
    //Coloca a seta no canto direito da célula
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


//Método chamado quando alguma linha é selecionada
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [G4LSeries setNumSerie:(int)indexPath.item];
    
    G4LViewControllerSerie *serie=[[G4LViewControllerSerie alloc] init];
    
    serie.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:serie animated:YES completion:nil];
    
}

//Método chamado quando o valor da Notificação é alterado
-(IBAction)mudaNotificacao:(id)sender
{
    NSLog(@"Botao acionado");
    
}


//Método chamado quando o botão de configuração é chamado
-(IBAction)botaoConfigurar:(id)sender
{
    G4LMostraSerie *view = [[G4LMostraSerie alloc]init];
    
    [self presentViewController:view animated:YES completion:nil];
    
}


//Carregar arquivos plists
-(void) carregarDadosNoiPhone
{

    //Carregar Serie escolhida pelo usuario
    G4LSeries *serieEscolhida=[G4LSeries serieEscolhida];
    
    
}
- (IBAction)iniciarRotina:(id)sender {
    
    G4LViewControllerSerie *serie=[[G4LViewControllerSerie alloc] init];
    
    serie.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:serie animated:YES completion:nil];
    
    
}



@end
