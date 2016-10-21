//
//  WXcategoriesModel.h
//  linkageMenu-2
//
//  Created by 王旭 on 2016/10/21.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXcategoriesModel : NSObject

/** highlighted_icon */
@property (nonatomic, strong) NSString *highlighted_icon;

/** highlighted_icon */
@property (nonatomic, strong) NSString *icon;

/** highlighted_icon */
@property (nonatomic, strong) NSString *name;

/** highlighted_icon */
@property (nonatomic, strong) NSArray *subcategories;

+(instancetype)categoriesWithDict:(NSDictionary *)dict;

@end
