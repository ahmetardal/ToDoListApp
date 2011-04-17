//
//  ToDoListViewController.h
//  ToDoList
//
//  Created by Ahmet Ardal on 4/17/11.
//  Copyright 2011 Ahmet Ardal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToDoListViewController: UIViewController<UITableViewDelegate,    
                                                    UITableViewDataSource,
                                                    UITextFieldDelegate>
{
    UITableView *todosTableView;
    UITextField *inputTextField;
    NSMutableArray *todos;
}

@property (nonatomic, retain) IBOutlet UITableView *todosTableView;
@property (nonatomic, retain) IBOutlet UITextField *inputTextField;
@property (nonatomic, retain) NSMutableArray *todos;

- (IBAction) addButtonTapped:(id)sender;

@end
