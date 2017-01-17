//
//  ViewController.m
//  TapChallenge
//
//  Created by ingrid on 13/01/17.
//  Copyright © 2017 Ingrid. All rights reserved.
//

#import "ViewController.h"
#define GameTimer 1 //è una macro, snippet
#define GameTime 30


@interface ViewController () {
    int _tapsCount;
    int _timeCount;
    
    NSTimer *_gameTimer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initializeGame];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    //memory pressure, poca disponibilità di risorse, si può rimuovere perchè tutto è gestito dai viewcontroller padre
}

-(void)initializeGame {
    _tapsCount = 0;
    _timeCount = GameTime;
    
    [self.tapsCountLabel setText:@"Tap to Play"];
    [self.timeLabel setText:[NSString stringWithFormat:@"Tap Challenge - %i sec", _timeCount]]; //per quando resetto il programma riporto il nome delle mie Label
    
    
    
}

#pragma mark - Actions 

-(IBAction)buttonPressed:(id)sender{
    NSLog(@"buttonPressed: %i", _tapsCount);
    
    //creo il timer solo se serve
    if(_gameTimer == nil) { //controllo per creare un unico timer e quindi non perdere il controllo sui vecchi timer
         _gameTimer = [NSTimer scheduledTimerWithTimeInterval: GameTimer target:self selector:@selector(timerTick) userInfo:nil repeats: true];
    }
    
    
    
    //@selector invoca un metodo
    
    _tapsCount++;
    
    [self.tapsCountLabel setText:[NSString stringWithFormat:@"%i", _tapsCount]];
}

-(void)timerTick{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    _timeCount--;
    
    [self.timeLabel setText:[NSString stringWithFormat:@"%i sec", _timeCount]];
    
    
    if(_timeCount == 0){
        [_gameTimer invalidate];
        _gameTimer = nil;
        
        
        
        NSString *message = [NSString stringWithFormat:@"Hai fatto %i Taps!", _tapsCount];
        
        UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle:@"OK!" message:message preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"ok action premuta");
            [self initializeGame];
            
        }];
        
        [alertViewController addAction:okAction];
        
        [self presentViewController:alertViewController animated:true completion:nil];
    }
}


@end
