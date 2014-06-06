//
//  G4LViewControllerSerie.m
//  gym4life
//
//  Created by Ramon Cruz  on 6/2/14.
//  Copyright (c) 2014 willie santos. All rights reserved.
//

#import "G4LViewControllerSerie.h"
#import "G4LSeries.h"
#import "G4LExercicio.h"

@interface G4LViewControllerSerie ()

@end

@implementation G4LViewControllerSerie
- (IBAction)seriesBotao:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)img_favoritar:(id)sender {
    
    NSLog(@"Favoritado!");


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
    [self iniciarExercicios];
    
     pageControlBeingUsed = NO;
    
    G4LSeries *serieEscolhida=[G4LSeries serieEscolhida];
    G4LExercicio *exercicio;
    
    CGRect imageViewFrame;
    CGRect labelOrientacaoFrame;

    UIImageView *imageViewExercicio ;
    UILabel *labelOrientacao;
    
    
    
    for (int i=0; i<[[serieEscolhida exercicios] count]; i++)
    {
    
        exercicio= [[serieEscolhida exercicios] objectAtIndex:0];
    
        
        imageViewFrame = CGRectMake(0.f, 0.f,240.f,240.f);
        labelOrientacaoFrame =CGRectMake(0.f, 240.f, 240.f, 70.f);
        
        imageViewFrame.origin.x=_scrollView.frame.size.width*i;
        labelOrientacaoFrame.origin.x=_scrollView.frame.size.width*i;
    
        imageViewExercicio = [[UIImageView alloc] initWithFrame:imageViewFrame];
        labelOrientacao=[[UILabel alloc ]initWithFrame:labelOrientacaoFrame];
    
        
        [imageViewExercicio setImage:[UIImage imageNamed:[[exercicio imagens] objectAtIndex:i]]];
        
        [imageViewExercicio setContentMode:UIViewContentModeScaleToFill];
        
        labelOrientacao.text=[[exercicio orientacao] objectAtIndex:i];
        labelOrientacao.textAlignment=NSTextAlignmentCenter;
        
        _ExercicioNome.text=[exercicio nome];
        [_scrollView addSubview:imageViewExercicio];
        [_scrollView addSubview:labelOrientacao];
    
    }//fim for
    
    //Habilita a paginação
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    
    
    _scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * [[serieEscolhida exercicios]count], self.scrollView.frame.size.height);

    //Faz o pageControl iniciar na primeira página, já que a view acabou de ser carregada.
    self.pageControl.currentPage = 0;
    
    //Define o número de páginas do pageControl
    self.pageControl.numberOfPages = [[serieEscolhida exercicios]count];
    
   
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

- (IBAction)paginaMudada:(id)sender {
    
    CGRect frame;
    
    frame.origin.x = self.scrollView.frame.size.width * self.pageControl.currentPage;
    frame.origin.y = 0;
    frame.size = self.scrollView.frame.size;
    [self.scrollView scrollRectToVisible:frame animated:YES];
    
    pageControlBeingUsed = YES;

}

-(void) iniciarExercicios
{
    /*Deixa a scrollview invisivel ao usuario
      e substitui o espaco por uma image view que 
     trocara as imagens dos exercicios
     */
    _scrollView.alpha=0;
    _pageControl.alpha=0;
    
    CGRect labelOrientacaoFrame;
    
    exerciciosImageView=[[UIImageView alloc]initWithFrame:_scrollView.frame];

    labelOrientacaoFrame =CGRectMake(0.f, 240.f, 240.f, 120.f);
    labelOrientacaoFrame.origin.x=exerciciosImageView.frame.origin.x;
    labelOrientacaoFrame.origin.y=exerciciosImageView.frame.size.width+exerciciosImageView.frame.origin.y;
    
    labelOrientacao = [[UILabel alloc]initWithFrame:labelOrientacaoFrame];
    
    
    //carrega  o cronometro com 10 segundos para cada exercicio
    cronometro =
    [NSTimer
     scheduledTimerWithTimeInterval:1          //A cada X segundos (no caso 1)
     target:self                               //Para um alvo (o próprio cronomero)
     selector:@selector(ContadorCronometro)    //Chama um seletor (no caso o método ContadorCronometro)
     userInfo:nil                              //Não sei pra que serve =3
     repeats:YES];                             //Se repete
    
    contador=10;
    
    [exerciciosImageView setImage:[UIImage imageNamed:[[[[[G4LSeries serieEscolhida] exercicios] firstObject] imagens] objectAtIndex:0]]];
    labelOrientacao.backgroundColor=[UIColor redColor];
    
    [self.view addSubview:labelOrientacao];
    [self.view addSubview:exerciciosImageView];
    
    
}

-(void)ContadorCronometro
{
    NSArray *exerciciosDaSerie=[[G4LSeries serieEscolhida]exercicios];
    qtdExercicios=[exerciciosDaSerie count];
    G4LExercicio *exercicioCorrente;
    
    //Assim que chamado, decrementa o contador geral
    contador --;
    
    //Quando o contador for menor que 0
    if(contador < 0)
    {
        
        //Incrementa o número do exercício
        exercicio++;
        
        //Quando acabar os exercícios
        if(exercicio == qtdExercicios)
        {
            
            //Retira a view
            [self dismissViewControllerAnimated:YES completion:nil];
            
        }else
        {
            
            //Imprime o valor do exercício
            exercicioCorrente =[exerciciosDaSerie objectAtIndex:exercicio];
            _ExercicioNome.text =[exercicioCorrente nome];
            
            [exerciciosImageView setImage:[UIImage imageNamed:[[exercicioCorrente imagens ] objectAtIndex:0]]];
            NSLog(@"imagem %@",[[exercicioCorrente imagens ] objectAtIndex:0]);
            
            [self.view addSubview:exerciciosImageView];
            
            //Reseta o contador geral
            contador = 10;
            
            //Imprime o valor do cronometro
            _cronometroLabel.text = [NSString stringWithFormat:@"00:%02d",contador];
        }
    }else{
        //Imprime o valor do cronometro
        _cronometroLabel.text = [NSString stringWithFormat:@"00:%02d",contador];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
