//
//  ViewController.h
//  Pantalla-de-login
//
//  Created by A1-IMAC13 on 22/10/21.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"
@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property NSString * curso;
@property bool cursoSeleccionado;
@property bool isLoged;


@end

