//
//  MyClass.m
//  Swift2
//
//  Created by Patrick Jayet on 22/06/15.
//  Copyright © 2015 Extrabright. All rights reserved.
//

#import "MyClass.h"


@implementation MyClass

- (nullable NSString*)toString1:(NSInteger)value
{
    return value < 0 ? nil : [NSString stringWithFormat:@"%li", (long)value];
}

- (nonnull NSString*)toString2:(NSInteger)value
{
    return [NSString stringWithFormat:@"%li", (long)value];
}

- (NSString*)toString3:(NSInteger)value
{
    return value < 0 ? nil : [NSString stringWithFormat:@"%li", (long)value];
}

@end
