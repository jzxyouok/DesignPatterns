//
//  ViewController.m
//  FactoryMethod
//
//  Created by HKY on 15/10/24.
//  Copyright © 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "IFactory.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *numberATextField;
@property (weak, nonatomic) IBOutlet UITextField *numberBTextField;
@property (weak, nonatomic) IBOutlet UILabel     *operateLabel;
@property (weak, nonatomic) IBOutlet UILabel     *resultLabel;

@end

@implementation ViewController

#pragma mark - Lifecycle
    
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(outEditing)];
    [self.view addGestureRecognizer:tap];
}

- (void)outEditing {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Btn Methods

- (IBAction)operateBtnTUI:(UIButton *)sender {
    _operateLabel.text = sender.titleLabel.text;
}

- (IBAction)resultBtnTUI:(UIButton *)sender {
    
    if ([_numberATextField.text isEqualToString:@""]||[_numberBTextField.text isEqualToString:@""]||![_numberATextField.text floatValue] ||![_numberBTextField.text floatValue]) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入数字" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    float numberA = [_numberATextField.text floatValue];
    float numberB = [_numberBTextField.text floatValue];
    
    
    NSString *operationStr = @"";
    
//    Operation *oper = [OperationFactory creatOperationWithSymbol:_operateLabel.text];
    IFactory *operFactory = [[AddFactory alloc]init];
    Operation *oper = [operFactory creatOperation];
    
    operationStr = [oper resultWithNumberA:numberA andNumberB:numberB];
    
    _resultLabel.text = operationStr;
}

- (IBAction)testBtnTUI:(id)sender {
}


@end
