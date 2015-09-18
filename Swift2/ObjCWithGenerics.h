//
//  ObjCWithGenerics.h
//  Swift2
//
//  Created by Patrick Jayet on 23/06/15.
//  Copyright © 2015 Extrabright. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ObjCWithGenerics : NSObject

- (nonnull NSArray<NSString *> *)names;
- (void)addViews:(nullable NSArray<UIView *> *)views;

@end
