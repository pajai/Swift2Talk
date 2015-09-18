//
//  ObjCWithGenerics.m
//  Swift2
//
//  Created by Patrick Jayet on 23/06/15.
//  Copyright © 2015 Extrabright. All rights reserved.
//

#import "ObjCWithGenerics.h"

@implementation ObjCWithGenerics

- (NSArray<NSString *> *)names
{
    NSArray<UIButton *> * buttons = @[[UIButton new], [UIButton new]];
    NSArray<UIView *> * views = buttons;
    for (UIView *view in views) {
        NSLog(@"This is a view: %@", view);
    }
    
    NSMutableArray<UIButton *> *mutableButtons = [NSMutableArray new];
    [mutableButtons addObject:[UIButton new]];
    
    NSMutableArray<UIView *> *mutableViews = mutableButtons;
    [mutableViews addObject:[UILabel new]];
    
    return @[@"john", @"alan"];
}

- (void)addViews:(NSArray<UIView *> *)views
{
    for (UIView *view in views) {
        NSLog(@"Some view: %@", view);
    }
}

@end
