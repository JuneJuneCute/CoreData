//
//  ViewController.m
//  CoreDataEasyTest
//
//  Created by uzone on 2017/8/18.
//  Copyright © 2017年 uzone. All rights reserved.
//

#import "ViewController.h"

#import <CoreData/CoreData.h>

#import "Employee+CoreDataProperties.h"
@interface ViewController ()
@property (nonatomic,strong)NSManagedObjectContext *context;
@end

@implementation ViewController

#pragma mark - 读取员工信息
- (IBAction)readEmployee:(id)sender {
    //创建一个请求对象(填入要查询的表名 -- 实体类)
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Employee"];
    
    //读取信息
    NSError *error = nil;
    NSArray *emps = [self.context executeFetchRequest:request error:&error];
    if (!error) {
        NSLog(@"%@",emps);
        for (Employee *emp in emps) {
            NSLog(@"%@  %d  %f",emp.name,emp.age,emp.height);
        }
    }else {
        NSLog(@"%@",error);
    }
    
    
}

#pragma mark - 添加员工信息
- (IBAction)addEmployee:(id)sender {
    
    //创建员工
    Employee *emp1 = [NSEntityDescription  insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:self.context];
    //设置员工属性
    emp1.name = @"wangwu";
    emp1.age = 28;
    emp1.height = 2.10;
    
    //保存 -- 通过上下文操作
    NSError *error = nil;
    [self.context save:&error];
    if (!error) {
        NSLog(@"success");
    }else {
        NSLog(@"%@",error);
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建一个数据库 company.sqlite
    //数据库要一张表 员工表 (name,age,height)
    //往数据库添加员工信息
    
    //CoreData
    [self setupContext];
    
}

- (void)setupContext {
    //1.上下文 关联Company.xcdatamodeld 模型文件
    
    NSManagedObjectContext *context = [[NSManagedObjectContext alloc] init];
    //关联模型文件
    
    //创建一个模型对象
    //穿一个nil 会把Bundle下的所有模型文件关联起来
    NSManagedObjectModel *model = [NSManagedObjectModel mergedModelFromBundles:nil];
    //持久化存储调度器
    NSPersistentStoreCoordinator *store = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    context.persistentStoreCoordinator = store;
    
    //存储数据库的名字
    NSError *error = nil;
    
    //获取document目录
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    //数据库保存路径
    NSString *sqlitePath = [doc stringByAppendingPathComponent:@"company.sqlite"];
    NSLog(@"%@",sqlitePath);
    [store addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[NSURL fileURLWithPath:sqlitePath] options:nil error:&error] ;
    
    self.context = context;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
