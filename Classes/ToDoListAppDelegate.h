//
//  ToDoListAppDelegate.h
//  ToDoList
//
//  Created by Ahmet Ardal on 4/17/11.
//  Copyright 2011 Ahmet Ardal. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ToDoListViewController;

@interface ToDoListAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ToDoListViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ToDoListViewController *viewController;

@end

