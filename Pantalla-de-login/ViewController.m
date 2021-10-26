//
//  ViewController.m
//  Pantalla-de-login
//
//  Created by A1-IMAC13 on 22/10/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

_cursoSeleccionado = NO;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
 
    
   }

-(void)viewDidAppear:(BOOL)animated{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if([userDefaults boolForKey:@"isLoged"]){
        // el usuario esta registrado asique se hace el segue solo
        NSLog(@"Usuario registrado, hacer segue automatico");
        UIStoryboard * mainSB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SecondViewController * secondVC = [mainSB instantiateViewControllerWithIdentifier:@"secondVC"];
        [self presentViewController:secondVC animated:YES completion:nil];
        
    }else{
        NSLog(@"El usuario NO esta registrado o ha cerrado sesion");
    }
}


- (IBAction)loginButton:(id)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString * userStr = _username.text;
    NSString * passStr = _password.text;
    UIStoryboard * mainSB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SecondViewController * secondVC = [mainSB instantiateViewControllerWithIdentifier:@"secondVC"];
    
    
    if([userStr length] >= 6|| [passStr length] >= 6){
        if( ([[userStr stringByAppendingString:@"."] isEqualToString:passStr] && _cursoSeleccionado) ){
            
            // guardar los datos del ususario
            //registrar datos en el userDefaults
            
            [userDefaults setObject:userStr forKey:@"userName"];
            [userDefaults setObject:passStr forKey:@"password"];
            [userDefaults setObject:self.curso forKey:@"curso"];
            [userDefaults setBool:YES forKey:@"isLoged"];
            
            //hacer segue pasando datos
            

            [self presentViewController:secondVC animated:YES completion:nil];
             
            
        }else{
            // alert con mensaje de error, solo tiene un boton para cerrarlo
            NSString * mensajeError = @"";
            if([userStr length] == 0){
                NSLog(@"Error en el nombre");
                mensajeError = [mensajeError stringByAppendingString:@"nombre "];
                
            }
            if(![[userStr stringByAppendingString:@"."] isEqualToString:passStr]){
                NSLog(@"Error en la contraseña");
                mensajeError = [mensajeError stringByAppendingString:@"contraseña "];
            }
            if(!_cursoSeleccionado){
                NSLog(@"Error en el curso");
                mensajeError = [mensajeError stringByAppendingString:@"curso"];
            }
            mensajeError = [@"Error en: "stringByAppendingString:mensajeError];
            UIAlertController * errorAlert = [UIAlertController alertControllerWithTitle:@"Error" message:mensajeError preferredStyle:UIAlertControllerStyleActionSheet];
            UIAlertAction * cerrar = [UIAlertAction actionWithTitle:@"Cerrar" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action){
                
            }];
            [errorAlert addAction:cerrar];
            [self presentViewController: errorAlert animated: YES completion: nil];
            
            
        }
    }else{
        UIAlertController * errorLongitud = [UIAlertController alertControllerWithTitle:@"Error" message:@"El nombre o la contraseña son demasiado cortos" preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction * cerrar = [UIAlertAction actionWithTitle:@"Cerrar" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action){
            
        }];
        [errorLongitud addAction:cerrar];
        [self presentViewController: errorLongitud animated: YES completion: nil];
        
    }
    
    

    
}
- (IBAction)crusoButton:(id)sender {
    NSString * curso;
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Selecciona el curso" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * alumnoDam = [UIAlertAction actionWithTitle:@"Alumno de DAM" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        // dar valor a curso
        self.curso = @"Alumno de DAM";
        NSLog(self.curso);
        //poner cursoSeleccionado a YES
        _cursoSeleccionado = YES;
    }];
    UIAlertAction * alumnoVid = [UIAlertAction actionWithTitle:@"Alumno de Videojuegos" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        // dar valor a curso
        self.curso = @"Alumno de Videojuegos";
        NSLog(self.curso);
        //poner cursoSeleccionado a YES
        _cursoSeleccionado = YES;
    }];
    UIAlertAction * cancelar = [UIAlertAction actionWithTitle:@"Cancelar" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action){
        _cursoSeleccionado = NO;
        
    }];
    [alert addAction:alumnoDam];
    [alert addAction:alumnoVid];
    [alert addAction:cancelar];
    [self presentViewController: alert animated: YES completion: nil];
}


@end
