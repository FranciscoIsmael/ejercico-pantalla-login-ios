//
//  SecondViewController.m
//  Pantalla-de-login
//
//  Created by A1-IMAC13 on 22/10/21.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // recuperar datos del user defaults y ponerlos en _ciclo.text y _username.text
//    _ciclo.text = _cicloStr;
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc]init];
    _ciclo.text = [userDefaults stringForKey:@"curso"];
//    _username.text = [@"Hola " stringByAppendingString:_usernameStr];
    _username.text = [@"Hola " stringByAppendingString:[userDefaults stringForKey:@"userName"]];
    
    if([userDefaults boolForKey:@"isLoged"]){
        NSLog(@"El usuario SI ha sido registrado");
    }else{
        NSLog(@"El usuario NO ha sido registrado");
    }
    
    
    
    
}
- (IBAction)cerrarSesion:(id)sender {
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc]init];
    [userDefaults setBool:NO forKey:@"isLoged"];
    [userDefaults setObject:@"" forKey:@"userName"];
    [userDefaults setObject:@"" forKey:@"password"];
    [userDefaults setObject:@"" forKey:@"curso"];
    
    
    //cerrar vista
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
