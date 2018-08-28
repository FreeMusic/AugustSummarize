//
//  Head.m
//  UISwich
//
//  Created by 橘子 on 2018/8/28.
//  Copyright © 2018年 橘子. All rights reserved.
//

#import "Head.h"
#import <objc/runtime.h>

@implementation Head
/**
 runtime快速归档
 */
-(void)encodeWithCoder:(NSCoder *)aCoder{
    unsigned int count;
    //获取属性列表
    Ivar *ivars = class_copyIvarList([Head class], &count);
    //遍历属性列表中的属性，并从中取值
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        //获取属性名字
        const char *name = ivar_getName(ivar);
        NSString *propertyName = [NSString stringWithUTF8String:name];
        
        id value = [self valueForKey:propertyName];
        [aCoder encodeObject:value forKey:propertyName];
    }
    free(ivars);//释放属性列表
}
/**
 tuntime快速解档
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        unsigned count = 0;
        //获取属性列表
        Ivar *ivars = class_copyIvarList([Head class], &count);
        for (int i = 0;  i < count; i++) {
            //取出属性
            Ivar ivar = ivars[i];
            //获取属性的名字
            const char *name = ivar_getName(ivar);
            NSString *propertyName = [NSString stringWithUTF8String:name];
            //键取值
            id value = [aDecoder decodeObjectForKey:propertyName];
            [self setValue:value forKey:propertyName];
        }
        free(ivars);
    }
    
    return self;
}

@end
