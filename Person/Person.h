//
//  Person.h
//  UISwich
//
//  Created by 橘子 on 2018/8/28.
//  Copyright © 2018年 橘子. All rights reserved.
//

#import "MyModel.h"
#import "Head.h"
#import "Body.h"
#import "Leg.h"

@interface Person : MyModel

@property (nonatomic, strong) Head *head;

@property (nonatomic, strong) Body *body;

@property (nonatomic, strong) Leg *leg;

@property (nonatomic, copy) NSString *age;

@property (nonatomic, copy) NSString *name;

@end
