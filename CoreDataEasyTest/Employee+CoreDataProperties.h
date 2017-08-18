//
//  Employee+CoreDataProperties.h
//  CoreDataEasyTest
//
//  Created by uzone on 2017/8/18.
//  Copyright © 2017年 uzone. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Employee+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Employee (CoreDataProperties)

+ (NSFetchRequest<Employee *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int16_t age;
@property (nonatomic) double height;

@end

NS_ASSUME_NONNULL_END
