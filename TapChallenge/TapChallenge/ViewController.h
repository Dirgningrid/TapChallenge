//
//  ViewController.h
//  TapChallenge
//
//  Created by ingrid on 13/01/17.
//  Copyright © 2017 Ingrid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic,weak) IBOutlet UILabel *tapsCountLabel;

@property (nonatomic,weak) IBOutlet UILabel *timeLabel;


-(IBAction)buttonPressed:(id)sender;


@end

