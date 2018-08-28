//
//  ViewController.m
//  UISwich
//
//  Created by 橘子 on 2018/8/27.
//  Copyright © 2018年 橘子. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

/**
 地址
 */
#define DocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES)lastObject]
#define UserDataPath [DocumentPath stringByAppendingPathComponent:@"User.data"]

@interface ViewController ()

@property (nonatomic, copy) NSMutableArray *firstCopyArray;

@property (nonatomic, strong) NSMutableArray *retainArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //归解档
    [self arCharveData];
    //可变数组用深拷贝修饰
    [self mutableArrayUseCopy];
    //UISWich 和 UIButton
    [self swichAndButtonAction];
}
/**
 归解档
 */
- (void)arCharveData{
    Person *person = [[Person alloc] initWithDictionary:[self createJson]];
    person.name = @"老大";
    person.leg.leghair = @"蓝色";
    //存值
    [NSKeyedArchiver archiveRootObject:person toFile:UserDataPath];
    //取值
    Person *him = [NSKeyedUnarchiver unarchiveObjectWithFile:UserDataPath];
    //用值
    NSLog(@"him.name = %@   him.leg.leghair = %@", him.name, him.leg.leghair);
}
/**
 可变数组用深拷贝修饰
 */
- (void)mutableArrayUseCopy{
//    self.firstCopyArray = [NSMutableArray array];
//    self.firstCopyArray = [NSMutableArray arrayWithArray:@[@"可变数组用copy修饰"]];
    self.firstCopyArray = [NSMutableArray arrayWithArray:@[@"可变数组用copy修饰", @"可变数组用copy修饰"]];
    self.retainArray = [NSMutableArray array];
    
    NSMutableArray *thirdArray = [@[@"可变数组用copy修饰"] mutableCopy];
    
    [[NSUserDefaults standardUserDefaults] setValue:thirdArray forKey:@"Array"];
    
    NSMutableArray *forthArray = [[NSUserDefaults standardUserDefaults] valueForKey:@"Array"];
    
    NSLog(@"firstCopyArray = %@   retainArray = %@   thirdArray = %@   forthArray = %@", [self.firstCopyArray class], [self.retainArray class], [thirdArray class], [forthArray class]);
    
}
/**
 UISWich 和 UIButton
 */
- (void)swichAndButtonAction{
    UISwitch *swich = [[UISwitch alloc] init];
    [swich addTarget:self action:@selector(swichClick:) forControlEvents:UIControlEventValueChanged];
    swich.frame = CGRectMake(100, 100, 100, 50);
    [self.view addSubview:swich];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"未选中" forState:UIControlStateNormal];
    [button setTitle:@"选中" forState:UIControlStateSelected];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(100, 200, 100, 50);
}
- (void)swichClick:(UISwitch *)swich{
    swich.on = !swich.on;
    NSLog(@"**********%d***********", swich.on);
}

- (void)buttonClick:(UIButton *)sender{
    sender.selected = !sender.selected;
}

- (NSMutableDictionary *)createJson{
    NSMutableDictionary *json = [NSMutableDictionary dictionary];
    NSDictionary *head = @{
                           @"hair": @"长发",
                           @"hairColor":@"黑色"
                           };
    NSDictionary *body = @{
                           @"arm":@"胳臂",
                           @"chest":@"胸膛"
                           };
    NSDictionary *leg = @{
                          @"leghair":@"腿毛",
                          @"legLong":@"腿长"
                          };
    [json setValue:head forKey:@"head"];
    [json setValue:body forKey:@"body"];
    [json setValue:leg forKey:@"leg"];
    [json setValue:@"小黑" forKey:@"name"];
    [json setValue:@"18" forKey:@"age"];
    
    return json;
}

@end
