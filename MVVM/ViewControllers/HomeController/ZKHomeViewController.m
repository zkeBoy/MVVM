//
//  ZKHomeViewController.m
//  MVVM
//
//  Created by Tom on 2017/12/1.
//  Copyright © 2017年 Tom. All rights reserved.
//

#import "ZKHomeViewController.h"
#import "ZKHomeTableViewCell.h"
#import "ZKHomeViewModel.h"

static NSString * const homeCellIdentifider = @"ZKHomeTableViewCell";

@interface ZKHomeViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) ZKHomeViewModel * homeVM;
@end

@implementation ZKHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.homeVM.rowNum;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZKHomeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:homeCellIdentifider forIndexPath:indexPath];
    [cell.imgView sd_setImageWithURL:[self.homeVM iconURLForIndexPath:indexPath]];
    cell.titleLabel.text = [self.homeVM titleForIndexPath:indexPath];
    cell.timeLabel.text = [self.homeVM timeForIndexPath:indexPath];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}


#pragma mark - lazy init
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.frame = self.view.bounds;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
        _tableView.separatorColor  = [UIColor clearColor];
        _tableView.dataSource = self;
        _tableView.delegate   = self;
        [_tableView registerClass:[ZKHomeTableViewCell class] forCellReuseIdentifier:homeCellIdentifider];
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.homeVM refreshDataWithCompleteHandler:^(NSError *error) {
                if (!error) {
                    [_tableView reloadData];
                }
                [_tableView.mj_header endRefreshing];
            }];
        }];
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self.homeVM getMoreDataWithCompleteHandler:^(NSError *error) {
                if (!error) {
                    [_tableView reloadData];
                }
                [_tableView.mj_footer endRefreshing];
            }];
        }];
        [_tableView.mj_header beginRefreshing];
    }
    return _tableView;
}

- (ZKHomeViewModel *)homeVM {
    if (!_homeVM) {
        _homeVM = [[ZKHomeViewModel alloc] init];
    }
    return _homeVM;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
