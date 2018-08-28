//
//  Person.m
//  UISwich
//
//  Created by 橘子 on 2018/8/28.
//  Copyright © 2018年 橘子. All rights reserved.
//  自定义对象作为一个对象的属性时，无法使用runtime进行归解档

#import "Person.h"

@implementation Person

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.head = [[Head alloc] initWithDictionary:dic[@"head"]];
        self.body = [[Body alloc] initWithDictionary:dic[@"body"]];
        self.leg = [[Leg alloc] initWithDictionary:dic[@"leg"]];
        self.name = dic[@"name"];
        self.age = dic[@"age"];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        if (self = [super init]) {
            self.head = [aDecoder decodeObjectForKey:@"head"];
            self.body = [aDecoder decodeObjectForKey:@"body"];
            self.leg = [aDecoder decodeObjectForKey:@"leg"];
            self.name = [aDecoder decodeObjectForKey:@"name"];
            self.age = [aDecoder decodeObjectForKey:@"age"];
        }
        
        return self;
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.head forKey:@"head"];
    [aCoder encodeObject:self.body forKey:@"body"];
    [aCoder encodeObject:self.leg forKey:@"leg"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.age forKey:@"age"];
}

@end
