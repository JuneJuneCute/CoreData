//
//  Employee+CoreDataProperties.m
//  CoreDataEasyTest
//
//  Created by uzone on 2017/8/18.
//  Copyright © 2017年 uzone. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Employee+CoreDataProperties.h"

@implementation Employee (CoreDataProperties)

+ (NSFetchRequest<Employee *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Employee"];
}

@dynamic name;
@dynamic age;
@dynamic height;

@end
