//
//  ViewController.m
//  ColTest
//
//  Created by 孙亚男 on 2017/10/23.
//  Copyright © 2017年 sam. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)UICollectionViewFlowLayout   *layout;
@property (nonatomic,strong)UICollectionView     *collectionView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadColletionView];
}

-(void)loadColletionView
{
    self.layout = [[UICollectionViewFlowLayout alloc]init];
    self.layout.minimumLineSpacing = 5;
    self.layout.minimumInteritemSpacing  = 5;
    
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 375, 667) collectionViewLayout:self.layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    self.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [self.view addSubview:_collectionView];
    //这种是nib注册
//    UINib   *cellNib = [UINib nibWithNibName:@"CollectionViewCell" bundle:nil]
//    [_collectionView registerNib:cellNib forCellWithReuseIdentifier:@"collectionViewCell"];
    
    //这种是自定义cell不带xib的注册
    //   [_collectionView registerClass:[CollectionViewCell1 class] forCellWithReuseIdentifier:@"myheheIdentifier"];
    //这种是原生cell的注册
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    
//    UINib   *cellnib1 = [UINib nibWithNibName:@"CollectionReusableView" bundle:nil];
    
    [_collectionView registerClass:[UICollectionViewCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader  withReuseIdentifier:@"head"];
    
    [_collectionView registerClass:[UICollectionViewCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter  withReuseIdentifier:@"head"];
    
}

//多少组
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    UICollectionViewCell   *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
//    UILabel *label1 = [[UILabel alloc]init];
//    [cell.contentView addSubview:label1];
//    label1.text = [NSString stringWithFormat:@"11 %ld",indexPath.row];
//    label1.frame = CGRectMake(0, 0, 100, 25);
    
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
 
    cell.backgroundColor=[UIColor groupTableViewBackgroundColor];
    return cell;
}


-(UICollectionReusableView  *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView    *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"head"  forIndexPath:indexPath];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(110, 20, 100, 30)];
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        label.text= @"头";
    }else{
        label.text= @"脚";
    }
    [view addSubview:label];
    return view;
}

-(UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(50, 60);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(50, 60);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(115, 100);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //cell被电击后移动的动画
    [collectionView selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionTop];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
