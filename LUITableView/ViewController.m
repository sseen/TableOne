//
//  ViewController.m
//  LUITableView
//
//  Created by OranWu on 13-1-5.
//  Copyright (c) 2013年 Oran Wu. All rights reserved.
//

#import "ViewController.h"

//*******************************************************************************
//这里我们添加UITableView 的两个委托 
//*******************************************************************************
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>{
    NSArray *dataArray;
    UIView *headerView;
    NSInteger lo;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CGRect frame = [self.view bounds];
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height-100)];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
    dataArray = [NSArray arrayWithObjects:
                 @"Google", @"百　度", @"网　易", @"微 博", @"优 酷 网", @"淘 宝 网",
                 @"亚 马 逊", @"艺龙酒店", @"美 团 网", @"上品折扣", @"C N T V", @"腾  讯",
                 @"新  浪", @"当　当", @"凤 凰 网", @"MSN中文网", @"猫　扑", @"s",nil];
    [tableView reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -------------------
#pragma mark UITableViewDataSource
//委托里 @required 的必须实现

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    //config the cell
    cell.textLabel.text = [dataArray objectAtIndex:indexPath.row];
    return cell;
}


#pragma mark -------------------
#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@", [dataArray objectAtIndex:indexPath.row]);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
//    NSLog(@"%@", lo);
    lo = 40;
    return lo+10;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (!headerView) {
        headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 400, 80)] ;
        headerView.backgroundColor = [UIColor purpleColor];
        UILabel *HeaderLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 460, 80)];
        HeaderLabel.backgroundColor = [UIColor brownColor];
        HeaderLabel.font = [UIFont boldSystemFontOfSize:17];
        HeaderLabel.textColor = [UIColor whiteColor];
        HeaderLabel.text = @"ssn";
        [headerView addSubview:HeaderLabel];
        HeaderLabel = nil;
    }
    return headerView;
}

@end
