//
//  ViewController.m
//  MyFirstObjCApp
//
//  Created by Manju Bhandary on 3/29/16.
//  Copyright © 2016 Manju Bhandary. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSDictionary *questionDict;
    NSArray *questions;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    questionDict = @{
                     @"Is New Delhi the capital of India?": @"YES",
                     @"Google is headquatered in San Francisco?": @"NO",
                     @"Does Italy border Spain?": @"NO",
                     @"Hollywood is the biggest film producer in the world?": @"NO",
                     @"Marble is a form of Limestone?": @"YES",
                     @"IBM stands for International Business Machines?": @"YES"
                     };
    questions = [questionDict allKeys];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(id)sender {
    
    int random = arc4random()%[questions count];
    
    NSString *question = [questions objectAtIndex:random];
    NSString *answer = [questionDict objectForKey:question];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Question" message:question preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
                                {
                                    [self checkAnswer:@"YES" correctAnswer:answer];
                                }];
    
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
                               {
                                   [self checkAnswer:@"NO" correctAnswer:answer];
                               }];

    
    [alert addAction:yesAction];
    [alert addAction:noAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)checkAnswer:(NSString*)answerGiven correctAnswer:(NSString*)correctAnswer {
    
    NSString *message = [[NSString alloc]init];
    
    if ([answerGiven isEqualToString:correctAnswer]) {
        message = @"You answered correctly";
    } else {
        message = @"You answered incorrectly";
    }
    
    UIAlertController *answerAlert = [UIAlertController alertControllerWithTitle:@"Question" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
                               {}];
    
    [answerAlert addAction:okAction];
    [self presentViewController:answerAlert animated:true completion:nil];
    
}

@end
