//
//  MyModel.m
//  UISwich
//
//  Created by 橘子 on 2018/8/28.
//  Copyright © 2018年 橘子. All rights reserved.
//

#import "MyModel.h"
#import <objc/runtime.h>

@implementation MyModel

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

- (id)valueForUndefinedKey:(NSString *)key
{
    return nil;
}


@end
