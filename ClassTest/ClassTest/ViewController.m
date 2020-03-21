//
//  ViewController.m
//  ClassTest
//
//  Created by 刘伟 on 2020/3/21.
//  Copyright © 2020 None. All rights reserved.
//

#import "ViewController.h"

#import "Person.h"
#import "Student.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self isKindOfClassTest];
    [self isMemberOfClassTest];
}

//ios 类的内部结构
//1. Class 和 Object 的定义
// An opaque type that represents an Objective-C class.
//typedef struct objc_class *Class;
//
// Represents an instance of a class.
//struct objc_object {
//    Class isa;
//};
//
// A pointer to an instance of a class.
//typedef struct objc_object *id;
//Class是一个指向objc_class结构体的指针，而id是一个指向objc_object结构体的指针，其成员isa是一个指向objec_class结构体的指针。
//
//2. objc_class 的定义
//struct objc_class {
//        Class isa; // 指向metaclass
//        Class super_class ; // 指向其父类
//        const char *name ; // 类名
//        long version ; // 类的版本信息，初始化默认为0，可以通过runtime函数class_setVersion和class_getVersion进行修改、读取
//        long info; // 一些标识信息,如CLS_CLASS (0x1L) 表示该类为普通 class 其中包含对象方法和成员变量;CLS_META (0x2L) 表示该类为 metaclass，其中包含类方法;
//        long instance_size ; // 该类的实例变量大小(包括从父类继承下来的实例变量);
//        struct objc_ivar_list *ivars; // 用于存储每个成员变量的地址
//        struct objc_method_list **methodLists ; // 与 info 的一些标志位有关,如CLS_CLASS (0x1L),则存储对象方法，如CLS_META (0x2L)，则存储类方法;
//        struct objc_cache *cache; // 指向最近使用的方法的指针，用于提升效率；
//        struct objc_protocol_list *protocols; // 存储该类遵守的协议
//    }
//isa：objec_object（对象）中isa指针指向的类结构称为class（也就是该对象所属的类），其中存放着普通成员变量与对象方法 （“-”开头的方法）；然而此处isa指针指向的类结构称为metaclass，其中存放着static类型的成员变量与static类型的方法 （“+”开头的方法）。
// super_class： 指向该类的父类的指针，如果该类是根类（如NSObject或NSProxy），那么super_class就为NULL。
//
//可以通过runtime函数class_setVersion和class_getVersion进行修改、读取
//        long info; // 一些标识信息,如CLS_CLASS (0x1L) 表示该类为普通 class ，

- (void)isKindOfClassTest {
//Returns a Boolean value that indicates whether the receiver is an instance of given class or an instance of any class that inherits from that class.
//返回一个布尔值，该值指示接收方是给定类的实例还是从该类继承的任何类的实例。
    Person *person = [Person new];
    Student *student = [Student new];
    BOOL isPerson = [person isKindOfClass:[person class]];
    BOOL isStudent = [student isKindOfClass:[person class]];
    BOOL isStudentObject = [student isKindOfClass:[NSObject class]];
    BOOL isPersonObject = [person isKindOfClass:[NSObject class]];
    NSLog(@"isKindOfClass = %@ person class = %@",@(isPerson),[person class]);//YES
    NSLog(@"isKindOfClass = %@ student class = %@",@(isStudent),[student class]);//YES
    NSLog(@"isKindOfClass = %@ NSObject class = %@",@(isStudentObject),[NSObject class]);//YES
    NSLog(@"isKindOfClass = %@",@(isPersonObject));//YES
    NSLog(@"isPerson = %@",@([person isKindOfClass:[Student class]]));//NO
    NSLog(@"======= %@",@([[person class] isKindOfClass:[Person class]]));//NO
    NSLog(@"------- %@",@([[Student class] isKindOfClass:[Person class]]));//NO
    
}

//源码
//+ (BOOL)isMemberOfClass:(Class)cls {
//    return object_getClass((id)self) == cls;
//}
//- (BOOL)isMemberOfClass:(Class)cls {
//    return [self class] == cls;
//}
- (void)isMemberOfClassTest {
//Returns a Boolean value that indicates whether the receiver is an instance of a given class.
//返回一个布尔值，该值指示接收方是否是给定类的实例。
    Student *student = [Student new];
    NSLog(@"class %@",@([student isMemberOfClass:[Student class]]));
    NSLog(@"instance %@",@([Student isMemberOfClass:[Student class]]));
    NSLog(@"----%@",@([[NSObject class] isMemberOfClass:[NSObject class]]));
}
@end
