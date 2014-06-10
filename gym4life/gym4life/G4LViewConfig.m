//
//  G4LViewConfig.m
//  viewConfiguracao
//
//  Created by willie santos on 02/06/14.
//  Copyright (c) 2014 willie santos. All rights reserved.
//

#import "G4LViewConfig.h"
#import "G4LViewConfigHora.h"
@interface G4LViewConfig ()

@end

@implementation G4LViewConfig

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    //Inicializar com as configuracoes do usuario
    //primeiro recuperar o configuracoes.plist
    NSArray *configuracoesPlist=[[NSArray alloc]initWithContentsOfFile:
                                 [[NSBundle mainBundle]pathForResource:@"configuracoes" ofType:@"plist"]];
    
    NSString *auxString;
    int auxNum=0;
    
    NSLog(@"configuracoes.plist %@",configuracoesPlist);
    
    if (configuracoesPlist==NULL)
    {
        [self.segunda setOn:1 animated:YES];
        [self.terca setOn:1 animated:YES];
        [self.quarta setOn:1 animated:YES];
        [self.quinta setOn:1 animated:YES];
        [self.sexta setOn:1 animated:YES];
        [self.sabado setOn:1 animated:YES];
        [self.domingo setOn:1 animated:YES];
        
    }else
    {
        //segunda
        auxString=[configuracoesPlist[0] objectForKey:@"segunda"];
        auxNum= ([auxString isEqualToString:@"true"])?1:0;
        [self.segunda setOn:auxNum animated:YES];
        
        //terca
        auxString=[configuracoesPlist[0] objectForKey:@"terca"];
        auxNum= ([auxString isEqualToString:@"true"])?1:0;
        [self.terca setOn:auxNum animated:YES];
        
        //quarta
        auxString=[configuracoesPlist[0] objectForKey:@"quarta"];
        auxNum= ([auxString isEqualToString:@"true"])?1:0;
        [self.quarta setOn:auxNum animated:YES];
        
        //quinta
        auxString=[configuracoesPlist[0] objectForKey:@"quinta"];
        auxNum= ([auxString isEqualToString:@"true"])?1:0;
        [self.quinta setOn:auxNum animated:YES];
        
        //sexta
        auxString=[configuracoesPlist[0] objectForKey:@"sexta"];
        auxNum= ([auxString isEqualToString:@"true"])?1:0;
        [self.sexta setOn:auxNum animated:YES];
        
        //sabado
        auxString=[configuracoesPlist[0] objectForKey:@"sabado"];
        auxNum= ([auxString isEqualToString:@"true"])?1:0;
        [self.sabado setOn:auxNum animated:YES];
        
        //domingo
        auxString=[configuracoesPlist[0] objectForKey:@"domingo"];
        auxNum= ([auxString isEqualToString:@"true"])?1:0;
        [self.domingo setOn:auxNum animated:YES];
        
        //horario
        auxString=[configuracoesPlist[0] objectForKey:@"horario"];
        self.strHorario = auxString;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)alertaMessagem:(UISwitch *)sender andDay:(int)day{
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSDate *hora = [dateFormatter dateFromString:self.strHorario];
    NSLog(@"%@",hora);
    
    //NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
    [dateFormatter setDateFormat:@"EEEE"];
    
    int diaSemana;
    
    if([[dateFormatter stringFromDate:[NSDate date]] isEqualToString:@"Sunday"]){
        diaSemana = 1;
    }else{
        if([[dateFormatter stringFromDate:[NSDate date]] isEqualToString:@"Monday"]){
            diaSemana = 2;
        }else{
            if([[dateFormatter stringFromDate:[NSDate date]] isEqualToString:@"Tuesday"]){
                diaSemana = 3;
            }else{
                if([[dateFormatter stringFromDate:[NSDate date]] isEqualToString:@"Wednesday"]){
                    diaSemana = 4;
                }else{
                    if([[dateFormatter stringFromDate:[NSDate date]] isEqualToString:@"Thursday"]){
                        diaSemana = 5;
                    }else{
                        if([[dateFormatter stringFromDate:[NSDate date]] isEqualToString:@"Friday"]){
                            diaSemana = 6;
                        }else{
                            diaSemana = 7;
                        }
                    }
                }
            }
        }
    }
    
    //gather current calendar
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    //gather date components from date
    NSDateComponents *dateComponents = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:[NSDate date]];
    
    
    //set date components
    [dateComponents setDay: day];
    [dateComponents setMonth:6];
    [dateComponents setYear:2014];
    
    //save date relative from date
    NSDate *date = [calendar dateFromComponents:dateComponents];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] ;
    NSDateComponents *comps = [gregorian components:NSWeekdayCalendarUnit fromDate:date];
    int weekday = [comps weekday];
    NSLog(@"weekday=%d",weekday);
    
    if (diaSemana == weekday) {
        localNotification.fireDate = date;
        localNotification.alertBody = [NSString stringWithFormat:@"Começou seu exercício!"];
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        localNotification.applicationIconBadgeNumber = 1;
        
        localNotification.repeatInterval = NSWeekdayCalendarUnit;
        
        NSLog(@"\n\n\nMarcou\n\n\n");
        
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
        
    }
    
}
- (IBAction)Salvar:(id)sender {
    //setando valor de horas
    self.strHorario = [[G4LViewConfigHora defaultHora]str];
    
    //Recuperando endereco do arquivo configuracoes.plist
    NSString *configuracoesPlistEndereco=[[NSBundle mainBundle] pathForResource:@"configuracoes" ofType:@"plist"];
    
    //Recuperando arquivo configuracoes.plist
    NSMutableArray *configuracoesPlist =[[NSMutableArray alloc]init];
    
    NSMutableDictionary *configuracoesDoUsuario=[[NSMutableDictionary alloc]init];
    
    [configuracoesDoUsuario setObject:((self.segunda.on)==1)?@"true":@"false" forKey:@"segunda"];
    [configuracoesDoUsuario setObject:((self.terca.on)==1)?@"true":@"false" forKey:@"terca"];
    [configuracoesDoUsuario setObject:((self.quarta.on)==1)?@"true":@"false" forKey:@"quarta"];
    [configuracoesDoUsuario setObject:((self.quinta.on)==1)?@"true":@"false" forKey:@"quinta"];
    [configuracoesDoUsuario setObject:((self.sexta.on)==1)?@"true":@"false" forKey:@"sexta"];
    [configuracoesDoUsuario setObject:((self.sabado.on)==1)?@"true":@"false" forKey:@"sabado"];
    [configuracoesDoUsuario setObject:((self.domingo.on)==1)?@"true":@"false" forKey:@"domingo"];
    [configuracoesDoUsuario setObject:self.strHorario forKey:@"horario"];
    
    [configuracoesPlist addObject:configuracoesDoUsuario];
    [configuracoesPlist writeToFile:configuracoesPlistEndereco atomically:YES];
    
    //alerta
    [self alertaMessagem:self.segunda andDay:2];
    [self alertaMessagem:self.terca andDay:3];
    [self alertaMessagem:self.quarta andDay:4];
    [self alertaMessagem:self.quinta andDay:5];
    [self alertaMessagem:self.sexta andDay:6];
    [self alertaMessagem:self.sabado andDay:7];
    [self alertaMessagem:self.domingo andDay:1];
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (IBAction)horarioSeries:(id)sender {
    G4LViewConfigHora *viewConfigHora=[G4LViewConfigHora defaultHora];
    
    viewConfigHora.modalTransitionStyle=UIModalPresentationFullScreen;
    [self presentViewController:viewConfigHora animated:YES completion:nil];
}
@end
