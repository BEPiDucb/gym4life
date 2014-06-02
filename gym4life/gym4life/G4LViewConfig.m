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
    if (self) {
        // Custom initialization
        self.segunda = @"true";
        self.terca = @"true";
        self.quarta = @"true";
        self.quinta = @"true";
        self.sexta = @"true";
        self.sabado = @"true";
        self.domingo = @"true";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switcSegunda:(id)sender {
    if ([sender isOn]) {
        self.segunda = @"true";
        NSLog(@"segunada on");
    }else{
        self.segunda = @"false";
        NSLog(@"segunada off");
    }
}
- (IBAction)switcTerca:(id)sender{
    if ([sender isOn]) {
        self.terca = @"true";
        NSLog(@"terca on");
    }else{
        self.terca = @"false";
        NSLog(@"terca off");
    }
}
- (IBAction)switcQuarta:(id)sender{
    if ([sender isOn]) {
        self.quarta = @"true";
        NSLog(@"quarta on");
    }else{
        self.quarta = @"false";
        NSLog(@"quarta off");
    }
}
- (IBAction)switcQuinta:(id)sender{
    if ([sender isOn]) {
        self.quinta = @"true";
        NSLog(@"quinta on");
    }else{
        self.quinta = @"false";
        NSLog(@"quinta off");
    }
}
- (IBAction)switcSexta:(id)sender{
    if ([sender isOn]) {
        self.sexta = @"true";
        NSLog(@"sexta on");
    }else{
        self.sexta = @"false";
        NSLog(@"sexta off");
    }
}
- (IBAction)switcSabado:(id)sender{
    if ([sender isOn]) {
        self.sabado = @"true";
        NSLog(@"sabado on");
    }else{
        self.sabado = @"false";
        NSLog(@"sabado off");
    }
}
- (IBAction)switcDomingo:(id)sender{
    if ([sender isOn]) {
        self.domingo = @"true";
        NSLog(@"domingo on");
    }else{
        self.domingo = @"false";
        NSLog(@"domingo off");
    }
}

- (IBAction)Salvar:(id)sender {
    //  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
    //   NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *documentsDirectory = [[NSBundle mainBundle]resourcePath];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"resource/date.plist"];
    //NSString  *path = [NSString stringWithFormat:@"%@/resource/%@", documentsDirectory,@"date.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSMutableDictionary *data;
    NSMutableArray *pList = [[NSMutableArray alloc]init];
    
    if ([fileManager fileExistsAtPath: path])
        data = [[NSMutableDictionary alloc] initWithContentsOfFile: path];
    
    else
        data = [[NSMutableDictionary alloc] init];
    
    [data setObject:self.segunda forKey:@"segunda"];
    [data setObject:self.terca forKey:@"terca"];
    [data setObject:self.quarta forKey:@"quarta"];
    [data setObject:self.quinta forKey:@"quinta"];
    [data setObject:self.sexta forKey:@"sexta"];
    [data setObject:self.sabado forKey:@"sabado"];
    [data setObject:self.domingo forKey:@"domingo"];
    
    [pList addObject:data];
    [pList writeToFile: path atomically:YES];
    
    NSArray *plistsNoCelular=[[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
    
    [plistsNoCelular enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        NSString *nomeArquivo=(NSString *) obj;
        NSString *extencaoArquivo =[[nomeArquivo stringByDeletingPathExtension] lowercaseString];
        
        if ([extencaoArquivo isEqualToString:@"plist"])
        {
            NSLog(@"%@",nomeArquivo);
        }
    }];
}
@end
