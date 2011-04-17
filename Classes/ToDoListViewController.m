//
//  ToDoListViewController.m
//  ToDoList
//
//  Created by Ahmet Ardal on 4/17/11.
//  Copyright 2011 Ahmet Ardal. All rights reserved.
//

#import "ToDoListViewController.h"


static NSString *const kToDoListFileName = @"todos.plist";


@interface ToDoListViewController(Private)
- (void) saveToDoListToFile;
- (void) loadToDoListFromFile;
@end


@implementation ToDoListViewController

@synthesize todosTableView, inputTextField, todos;

- (void) viewDidLoad
{
    [super viewDidLoad];

    [self.todosTableView setBackgroundColor:[UIColor clearColor]];
    [self.inputTextField setReturnKeyType:UIReturnKeyDone];
    [self.inputTextField setDelegate:self];
    [self loadToDoListFromFile];
}

- (IBAction) addButtonTapped:(id)sender
{
    if ([self.inputTextField.text isEqualToString:@""]) {
        return;
    }

    NSLog(@"self.inputTextField.text: %@", self.inputTextField.text);
    [self.todos addObject:self.inputTextField.text];
    [self.inputTextField setText:@""];
    [self.todosTableView reloadData];
    [self saveToDoListToFile];
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) viewDidUnload
{
}

- (void) dealloc
{
    [self.todosTableView release];
    [self.inputTextField release];
    [self.todos release];
    [super dealloc];
}


#pragma mark -
#pragma mark Private Methods

- (void) saveToDoListToFile
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [docsDirectory stringByAppendingPathComponent:kToDoListFileName];
    [self.todos writeToFile:filePath atomically:YES];
}

- (void) loadToDoListFromFile
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [docsDirectory stringByAppendingPathComponent:kToDoListFileName];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath] == NO) {
        NSMutableArray *a = [[NSMutableArray alloc] init];
        self.todos = a;
        [a release];
    }
    else {
        NSMutableArray *savedTodos = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
        self.todos = savedTodos;
        [savedTodos release];
    }
}


#pragma mark -
#pragma mark UITableViewDelegate & UITableViewDataSource Methods

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.todos count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"ToDoCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId] autorelease];
    }

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.textLabel.text = [self.todos objectAtIndex:indexPath.row];

    return cell;
}


#pragma mark -
#pragma mark UITextFieldDelegate Methods

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

@end
