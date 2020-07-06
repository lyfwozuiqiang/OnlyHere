//
//  SearchController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/2.
//  Copyright © 2020 None. All rights reserved.
//

#import "SearchController.h"

#import "SearchItemCell.h"
#import "SearchReusableView.h"
#import "SearchStoreCell.h"
#import "SearchGoodsCell.h"
#import "SearchResultHeaderView.h"

typedef NS_ENUM(NSInteger,SearchResultType) {
    SearchResultStore,
    SearchResultGoods
};
@interface SearchController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,SearchReusableViewDelegate,SearchResultHeaderViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *searchCollectionView;
@property (strong, nonatomic) IBOutlet UIView *searchView;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (strong, nonatomic) IBOutlet UIView *searchNoResultView;
@property (strong, nonatomic) IBOutlet UITableView *searchResultTableView;

@property (assign, nonatomic) SearchResultType searchType;

@property (strong, nonatomic) NSMutableArray *searchRecordArray;
@property (strong, nonatomic) NSMutableArray *hotSearchArray;

@end

@implementation SearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchType = SearchResultStore;
    
    [self configSearchView];
    [self querySearchHistoryRecord];
    
    [self.searchCollectionView registerNib:[UINib nibWithNibName:@"SearchItemCell" bundle:nil] forCellWithReuseIdentifier:@"SearchItemCell"];
    [self.searchCollectionView registerNib:[UINib nibWithNibName:@"SearchReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SearchReusableView"];
    [self.searchResultTableView registerNib:[UINib nibWithNibName:@"SearchStoreCell" bundle:nil] forCellReuseIdentifier:@"SearchStoreCell"];
    [self.searchResultTableView registerNib:[UINib nibWithNibName:@"SearchGoodsCell" bundle:nil] forCellReuseIdentifier:@"SearchGoodsCell"];
    [self.searchResultTableView registerNib:[UINib nibWithNibName:@"SearchResultHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"SearchResultHeaderView"];
}

//MARK:- UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    if (self.searchRecordArray.count) {
        return 2;
    }else {
        return 1;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.searchRecordArray.count) {
        if (section == 0) {
            return self.searchRecordArray.count;
        }
    }
    return self.hotSearchArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SearchItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SearchItemCell" forIndexPath:indexPath];
    cell.titleString = self.searchRecordArray[indexPath.row];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    SearchReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SearchReusableView" forIndexPath:indexPath];
    if (self.searchRecordArray.count) {
        if (indexPath.section == 0) {
            reusableView.titleString = @"搜索历史";
        }else {
            reusableView.titleString = @"热门搜索";
        }
    }else {
         reusableView.titleString = @"热门搜索";
    }
    reusableView.headerSection = indexPath.section;
    reusableView.delegate = self;
    return reusableView;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(kScreenWidth, 55);
}

//MARK:- UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *titleString = self.searchRecordArray[indexPath.row];
    CGFloat titleStringLength = [titleString boundingRectWithSize:CGSizeMake(kScreenWidth - 60, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size.width;
    return CGSizeMake(titleStringLength + 30, 28);
}

//MARK:- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.searchView endEditing:YES];
    if (self.searchRecordArray.count) {
        if (indexPath.section == 0) {
            self.searchTextField.text = self.searchRecordArray[indexPath.row];
        }else {
            self.searchTextField.text = self.hotSearchArray[indexPath.row];
        }
    }else {
        self.searchTextField.text = self.hotSearchArray[indexPath.row];
    }
}

//MARK:- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.searchType == SearchResultStore) {
        SearchStoreCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchStoreCell"];
        return cell;
    }else {
        SearchGoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchGoodsCell"];
        return cell;
    }
}
//MARK:- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.searchType == SearchResultStore) {
        return 102;
    }else {
        return UITableViewAutomaticDimension;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    SearchResultHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"SearchResultHeaderView"];
    headerView.searcyType = self.searchType;
    headerView.delegate = self;
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 58;
}
//MARK:- UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField endEditing:YES];
    [self saveSearchHistoryRecord];
    if (textField.text.length > 0 && textField.text.length < 3) {
        [self.searchResultTableView removeFromSuperview];
        self.searchNoResultView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - kNavigationHeight);
        [self.view addSubview:self.searchNoResultView];
    }else if (textField.text.length >= 3) {
        [self.searchNoResultView removeFromSuperview];
        self.searchResultTableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - kNavigationHeight);
        [self.view addSubview:self.searchResultTableView];
    }else {
        [self.searchNoResultView removeFromSuperview];
        [self.searchResultTableView removeFromSuperview];
    }
    return YES;
}

//MARK:- SearchReusableViewDelegate
- (void)didRightButtonClickAtSection:(NSInteger)headerSection {
    if (self.searchRecordArray.count) {
        if (headerSection == 0) {
            [self.searchRecordArray removeAllObjects];
            [UserDefaults setObject:nil forKey:SearchHistoryRecord];
            [UserDefaults synchronize];
        }else {
            NSLog(@"换一换");
        }
    }
    
    [self.searchCollectionView reloadData];
}

//MARK:- SearchReusableViewDelegate
- (void)didSearchResultButtonClickWithType:(NSInteger)type {
    self.searchType = type;
    [self.searchResultTableView reloadData];
}

//MARK:- Action
- (IBAction)cancelButtonClick {
    [self dismissViewControllerAnimated:NO completion:nil];
}

//MARK:- Method
- (void)configSearchView {
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
    self.searchView.frame = CGRectMake(0, 10, kScreenWidth - 15, 30);
    [backgroundView addSubview:self.searchView];
    self.navigationItem.titleView = backgroundView;
}

- (void)querySearchHistoryRecord {
    NSArray *historyRecordArray = [UserDefaults objectForKey:SearchHistoryRecord];
    [self.searchRecordArray addObjectsFromArray:historyRecordArray];
}

- (void)saveSearchHistoryRecord {
    if (![self.searchRecordArray containsObject:self.searchTextField.text] && self.searchTextField.text.length) {
        [self.searchRecordArray safeInsertObject:self.searchTextField.text atIndex:0];
        [UserDefaults setObject:self.searchRecordArray forKey:SearchHistoryRecord];
        [UserDefaults synchronize];
        [self.searchCollectionView reloadData];
    }
}

//MARK:- Lazy
- (NSMutableArray *)searchRecordArray {
    if (!_searchRecordArray) {
        _searchRecordArray = [NSMutableArray array];
    }
    return _searchRecordArray;
}

- (NSMutableArray *)hotSearchArray {
    if (!_hotSearchArray) {
        _hotSearchArray = [NSMutableArray array];
    }
    return _hotSearchArray;
}

@end
