//
//  UINavigationController+ABExtras.m
//  SquaresFlipNavigationExample
//
//  Created by Andrés Brun on 8/8/13.
//  Copyright (c) 2013 Andrés Brun. All rights reserved.
//

#import "UINavigationController+ABExtras.h"

//IOS7
#define CURRENT_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define IS_EARLIER_IOS7 ( CURRENT_VERSION < 7.0)

@implementation UINavigationController (ABExtras)


- (float) calculateYPosition
{
    float yPosition=0;
    
    UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    if (self.navigationBar) {
        yPosition += CGRectGetMaxY(self.navigationBar.frame);
    } else{
        if (!self.navigationBarHidden) {
            if (UIInterfaceOrientationIsPortrait(interfaceOrientation)){
                yPosition += self.navigationBar.frame.size.height;
            }else{
                yPosition += self.navigationBar.frame.size.width;
            }
        }
        
        if (IS_EARLIER_IOS7 && ![UIApplication sharedApplication].statusBarHidden){
            if (UIInterfaceOrientationIsPortrait(interfaceOrientation)){
                yPosition += [UIApplication sharedApplication].statusBarFrame.size.height;
            }else{
                yPosition += [UIApplication sharedApplication].statusBarFrame.size.width;
            }
        }
    }
    
    return yPosition;
    
}

@end
