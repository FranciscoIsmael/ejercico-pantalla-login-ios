//
//  SecondViewController.h
//  Pantalla-de-login
//
//  Created by A1-IMAC13 on 22/10/21.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondViewController : UIViewController
@property NSString * usernameStr;
@property NSString * cicloStr;
@property (strong, nonatomic) IBOutlet UILabel *ciclo;
@property (strong, nonatomic) IBOutlet UILabel *username;
@end

NS_ASSUME_NONNULL_END
