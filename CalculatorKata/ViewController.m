//
//  ViewController.m
//  CalculatorKata
//
//  Created by Christopher Lam on 6/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize inputText;
@synthesize resultText;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setInputText:nil];
    [self setResultText:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)calculateButton:(id)sender {
    @try{
        Calculator *calculator = [[Calculator alloc] init];
        int result = [calculator add:self.inputText.text];
        self.resultText.text = [NSString stringWithFormat:@"%d",result];
    } @catch(NSException *exception1){
        self.resultText.text = [NSString stringWithFormat:@"%@",exception1.name];
    }
}
@end
