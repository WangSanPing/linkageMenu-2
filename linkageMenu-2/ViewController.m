//
//  ViewController.m
//  linkageMenu-2
//
//  Created by 王旭 on 2016/10/21.
//  Copyright © 2016年 wangxu. All rights reserved.
//

#import "ViewController.h"
#import "WXcategoriesModel.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableViewOne;
@property (weak, nonatomic) IBOutlet UITableView *tableViewTwo;
/** array */
@property (nonatomic, strong) NSArray *list;
/** subArray */
@property (nonatomic, strong) NSArray *subList;

@end

@implementation ViewController

NSString *oneID = @"oneID";
NSString *twoID = @"twoID";

- (NSArray *)list{
    if(_list == nil){
        
        NSArray *temp = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"categories" ofType:@"plist"]];
        NSMutableArray *temp2 = [NSMutableArray array];
        for (NSDictionary *item in temp) {
            [temp2 addObject:[WXcategoriesModel categoriesWithDict:item]];
        }
        
        _list = temp2;
    }
    return _list;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableViewOne registerClass:[UITableViewCell class] forCellReuseIdentifier:oneID];
    [self.tableViewTwo registerClass:[UITableViewCell class] forCellReuseIdentifier:twoID];
    
    self.tableViewOne.delegate = self;
    self.tableViewOne.dataSource = self;
    self.tableViewTwo.dataSource = self;
}

#pragma mark - delegate

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(tableView == self.tableViewOne)
        return self.list.count;
    
    return self.subList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(tableView == self.tableViewOne){
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:oneID];
        
        WXcategoriesModel *item = self.list[indexPath.row];
        
        cell.textLabel.text = item.name;
        cell.imageView.image = [UIImage imageNamed:item.icon];
        cell.imageView.highlightedImage = [UIImage imageNamed:item.highlighted_icon];
        
        return cell;
    }else{
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:twoID];
        
        cell.textLabel.text = self.subList[indexPath.row];
        
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WXcategoriesModel *item = self.list[indexPath.row];
    
    self.subList = item.subcategories;
    [self.tableViewTwo reloadData];
}

@end
