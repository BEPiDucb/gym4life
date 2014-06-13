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
    
       
    //Para mudar no objeto corrente
  //  [G4LSeries setNumSerie:[G4LSeries serieClicada]];
    //mudando opcao de serie no plist
    NSMutableArray *seriesPlist=
    [[NSMutableArray alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"series" ofType:@"plist" ]];
    
    NSNumber *serieEscolhida =[[NSNumber alloc]initWithInt:[G4LSeries serieClicada]];
    [seriesPlist replaceObjectAtIndex:([seriesPlist count]-1) withObject:serieEscolhida];
    [seriesPlist writeToFile:[[NSBundle mainBundle] pathForResource:@"series" ofType:@"plist"] atomically:YES];
    

    NSLog(@"%@",serieEscolhida);
    
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
    if ([G4LSeries serieClicada]==-1)
        [self iniciarExercicios];
    else
        [self verExerciciosDaSerie:[G4LSeries serieClicada]];
   
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
    _favoritar_img.alpha=0;
    _seriesVoltar.alpha=0;
    
    
    G4LSeries *serieEscolhida=[G4LSeries serieEscolhida];
    animacoesExercicios=[[NSMutableArray alloc]init];
    indexExercicioCorrenteAnimacao=0;
    tempoTroca=0;
    tempoTotal=0;
    
    for (int i=0;i<[[serieEscolhida exercicios] count];i++)
    {
        [animacoesExercicios addObject:[[serieEscolhida exercicios] objectAtIndex:i]];
    }
    
    
    
    //carrega  o cronometro com 10 segundos para cada exercicio
    cronometro =
    [NSTimer
     scheduledTimerWithTimeInterval:1          //A cada X segundos (no caso 1)
     target:self                               //Para um alvo (o próprio cronomero)
     selector:@selector(ContadorCronometro)    //Chama um seletor (no caso o método ContadorCronometro)
     userInfo:nil                              //Não sei pra que serve =3
     repeats:YES];                             //Se repete
    
    contador=0;
    minutos=0;
    segundos=0;
    
    
    
}

- (IBAction)terminarBotao:(id)sender {
    
    [_exerciciosImageView stopAnimating];
    [cronometro invalidate];
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void) ContadorCronometro
{
    //Configura transicao das imagens
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade;
   
    //atualizando o marcador de tempo
    
    if (segundos==60)
    {
        minutos++;
        segundos=0;
    }
    _cronometroLabel.text = [NSString stringWithFormat:@"%d:%02d",minutos,segundos];
    
    tempoTotal=[[[G4LSeries serieEscolhida] exercicios]count]*10 + (([[[G4LSeries serieEscolhida] exercicios]count])-1)*0;
    
    if ((contador %10)==0)
    {
        _ExercicioNome.text=[[animacoesExercicios objectAtIndex:indexExercicioCorrenteAnimacao]nome];
        _exerciciosImageView.animationImages=[[animacoesExercicios objectAtIndex:indexExercicioCorrenteAnimacao]imagens];
        _exerciciosImageView.animationDuration=10;
        [_exerciciosImageView startAnimating];
        [_exerciciosImageView.layer addAnimation:transition forKey:nil]; //insere transicao de imagem mais suave


        if (indexExercicioCorrenteAnimacao<([[[G4LSeries serieEscolhida] exercicios]count]-1))
        {
            indexExercicioCorrenteAnimacao++;
        }
        
        
    }
        tempoTroca=tempoTotal/[[[G4LSeries serieEscolhida] exercicios]count];
    if (contador==tempoTotal)
    {
        [cronometro invalidate];
        [_exerciciosImageView stopAnimating];
        [self dismissViewControllerAnimated:YES completion:nil];
        NSLog(@"Fim Da Serie");
    }
    
   segundos++;
   contador++;
    
}

-(void) verExerciciosDaSerie:(int) indexSerie
{
    
    pageControlBeingUsed = NO;
    _terminarBotao.alpha=0;
    _cronometroLabel.alpha=0;
    _labelOrientacao.alpha=0;
    _ExercicioNome.alpha=0;
    
    
    [G4LSeries setNumSerie:indexSerie];
    G4LSeries *serieEscolhida=[G4LSeries serieEscolhida];
    G4LExercicio *exercicio;
   // NSArray *exerciciosDaSerie=[serieEscolhida]
    
    CGRect imageViewFrame;
    CGRect labelNomeExercicioFrame;
    
    UIImageView *imageViewExercicio ;
    UILabel *labelNomeExercicio;
    
    
    
    for (int i=0; i<[[serieEscolhida exercicios] count]; i++)
    {
        
        exercicio= [[serieEscolhida exercicios] objectAtIndex:i];
        
        
        imageViewFrame = CGRectMake(0.f, 24.f,240.f,240.f);
        
        imageViewFrame.origin.x=_scrollView.frame.size.width*i;
        
        labelNomeExercicioFrame = CGRectMake(0.f, 0.f,240.f,24.f);
        labelNomeExercicioFrame.origin.x=_scrollView.frame.size.width*i;
        
        labelNomeExercicio = [[UILabel alloc]initWithFrame:labelNomeExercicioFrame];
        labelNomeExercicio.text=[exercicio nome];
        labelNomeExercicio.textAlignment=NSTextAlignmentCenter;
        
        imageViewExercicio = [[UIImageView alloc] initWithFrame:imageViewFrame];
       
        [imageViewExercicio setImage:[[exercicio imagens] objectAtIndex:0]];
        [imageViewExercicio setContentMode:UIViewContentModeScaleToFill];
        
        
        [_scrollView addSubview:labelNomeExercicio];
        [_scrollView addSubview:imageViewExercicio];
     
        
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
