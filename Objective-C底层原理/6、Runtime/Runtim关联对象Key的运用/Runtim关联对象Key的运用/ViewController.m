//
//  ViewController.m
//  Runtim关联对象Key的运用
//
//  Created by mingjun zhang on 2018/7/7.
//  Copyright © 2018年 mingjun zhang. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "Person.h"
#import "Person+TextOne.h"
#import "Person+TextTwo.h"
#import "Person+TextThree.h"
#import "Person+TextFour.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
//    [self assignmentValue]; //赋值的Key
    
//    [self assignmentValueTwo]; //内存地址的Key
  
//    [self assignmentValueThree];  //使用属性名的Key
    
//    [self assignmentValueFour]; //使用get方法的@selecor作为key
    
    [self assignmentValueFive]; //移除关联对象 和 移除所有的关联对象

}


#pragma 移除关联对象 和 移除所有的关联对象
-(void)assignmentValueFive{

    Person *person1 = [Person new];
    person1.degree = @"W";
    
    Person *person2 = [Person new];
    
    // 移除关联对象
    person2.degree = nil;
    
    // 移除所有的关联对象
    objc_removeAssociatedObjects(person2);
    
    NSLog(@"person1 程度==  %@",person1.degree);
    NSLog(@"person2 程度==  %@",person2.degree);

}

#pragma 使用get方法的@selecor作为key 形式的关联对象
-(void)assignmentValueFour{
    
    Person *person1 = [Person new];
    person1.degree = @"W";
    
    Person *person2 = [Person new];
    person2.degree =@"C";
    
    NSLog(@"person1 程度==  %@",person1.degree);
    NSLog(@"person2 程度==  %@",person2.degree);

}


#pragma 使用属性名  #define JKRevelKey @"revel" 形式的关联对象
-(void)assignmentValueThree{
    
    Person *person1 = [Person new];
    person1.revel = 20;
    
    Person *person2 = [Person new];
    person2.revel = 30;
    
    NSLog(@"person1 水平==  %d",person1.revel);
    NSLog(@"person2 水平==  %d",person2.revel);
    
}



#pragma 内存地址 key : static char ZMJWeightKey;; 形式的关联对象
-(void)assignmentValueTwo{

    Person *person1 = [Person new];
    person1.weight = 40;
    
    Person *person2 = [Person new];
    person2.weight = 20;
    
    NSLog(@"person1 年龄==  %d 身高== %d",person1.age,person1.height);
    NSLog(@"person2 年龄==  %d 身高== %d",person2.age,person2.height);
    
}



#pragma 赋值  const void *ZMJNameKey = &ZMJNameKey; 形式的关联对象
-(void)assignmentValueOne{
    
    Person *personOne = [Person new];
    personOne.age = 20;
    personOne.name = @"ZMJ";
    
    Person *personTwo = [Person new];
    personTwo.age = 21;
    personTwo.name = @"LQ";
    
    NSLog(@"person1 年龄==  %d  名字== %@",personOne.age,personOne.name);
    NSLog(@"person2 年龄==  %d  名字== %@",personTwo.age,personTwo.name);
    
}




































- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end





