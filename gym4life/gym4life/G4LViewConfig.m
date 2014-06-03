//
//  G4LViewConfig.m
//  viewConfiguracao
//
//  Created by willie santos on 02/06/14.
//  Copyright (c) 2014 willie santos. All rights reserved.
//

#import "G4LViewConfig.h"

@interface G4LViewConfig ()

@end

@implementation G4LViewConfig

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
//        self.segunda = @"true";
//        self.terca = @"true";
//        self.quarta = @"true";
//        self.quinta = @"true";
//        self.sexta = @"true";
//        self.sabado = @"true";
//        self.domingo = @"true";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //Inicializar com as configuracoes do usuario
    //primeiro recuperar o configuracoes.plist
    NSArray *configuracoesPlist=[[NSArray alloc]
                                 initWithContentsOfFile:[
                                                         [NSBundle mainBundle] pathForResource:@"configuracoes" ofType:@"plist"]
                                 ];
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
        
        NSLog(@"Entrei no if");
        
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
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)Salvar:(id)sender {
    
    
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
    
    [configuracoesPlist addObject:configuracoesDoUsuario];
    [configuracoesPlist writeToFile:configuracoesPlistEndereco atomically:YES];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
   //Apagar esse codigo
//    
//    //  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
//    //   NSString *documentsDirectory = [paths objectAtIndex:0];
//    
//    NSString *documentsDirectory = [[NSBundle mainBundle]resourcePath];
//    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"resource/date.plist"];
//    //NSString  *path = [NSString stringWithFormat:@"%@/resource/%@", documentsDirectory,@"date.plist"];
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSMutableDictionary *data;
//    NSMutableArray *pList = [[NSMutableArray alloc]init];
//    
//    if ([fileManager fileExistsAtPath: path])
//        data = [[NSMutableDictionary alloc] initWithContentsOfFile: path];
//    
//    else
//        data = [[NSMutableDictionary alloc] init];
//    
//    [data setObject:self.segunda forKey:@"segunda"];
//    [data setObject:self.terca forKey:@"terca"];
//    [data setObject:self.quarta forKey:@"quarta"];
//    [data setObject:self.quinta forKey:@"quinta"];
//    [data setObject:self.sexta forKey:@"sexta"];
//    [data setObject:self.sabado forKey:@"sabado"];
//    [data setObject:self.domingo forKey:@"domingo"];
//    
//    [pList addObject:data];
//    [pList writeToFile: path atomically:YES];
//    
//    NSArray *plistsNoCelular=[[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
//    
//    [plistsNoCelular enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//        
//        NSString *nomeArquivo=(NSString *) obj;
//        NSString *extencaoArquivo =[[nomeArquivo stringByDeletingPathExtension] lowercaseString];
//        
//        if ([extencaoArquivo isEqualToString:@"plist"])
//        {
//            NSLog(@"%@",nomeArquivo);
//        }
//    }];
}



@end
