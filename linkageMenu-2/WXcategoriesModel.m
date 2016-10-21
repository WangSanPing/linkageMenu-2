//
//  WXcategoriesModel.m
//  linkageMenu-2
//
//  Created by 王旭 on 2016/10/21.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "WXcategoriesModel.h"

@implementation WXcategoriesModel

+(instancetype)categoriesWithDict:(NSDictionary *)dict{
    WXcategoriesModel *model = [[self alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}
@end
