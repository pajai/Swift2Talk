//
//  MyClass.h
//  Swift2
//
//  Created by Patrick Jayet on 22/06/15.
//  Copyright © 2015 Extrabright. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyClass : NSObject

NS_ASSUME_NONNULL_BEGIN
- (nullable NSString*)toString1:(NSInteger)value;
- (nonnull  NSString*)toString2:(NSInteger)value;
- (null_unspecified NSString*)toString3:(NSInteger)value;
NS_ASSUME_NONNULL_END

@end
