//
//  ViewController.m
//  PhotosDemo
//
//  Created by LSH on 2017/10/17.
//  Copyright © 2017年 ZhangKang. All rights reserved.
//

#import "ViewController.h"
#import "PhotoCollectionViewCell.h"
#import "FZJPhotoTool.h"

#define kItemSpace 6
#define kItemW (kSCreen_W-5*kItemSpace)/4.0

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSArray<FZJPhotoList *> *lists;

@property (nonatomic,strong) NSMutableArray<PHAsset*> *collectionData;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self collectionView];
    _lists = [[FZJPhotoTool defaultFZJPhotoTool] getAllPhotoList];
    self.collectionData = [NSMutableArray arrayWithArray:[[FZJPhotoTool defaultFZJPhotoTool] getAssetsInAssetCollection:_lists[0].assetCollection ascending:NO]];
    self.navigationItem.title = _lists[0].title;
    [self.collectionView reloadData];
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.collectionData.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"photoCell" forIndexPath:indexPath];
    CGSize size = cell.size;
    cell.backgroundColor = [UIColor cyanColor];
    size.width *= [UIScreen mainScreen].scale;
    size.height *= [UIScreen mainScreen].scale;
    [[FZJPhotoTool defaultFZJPhotoTool] getImageByAsset:self.collectionData[indexPath.row] makeSize:size makeResizeMode:PHImageRequestOptionsResizeModeExact completion:^(UIImage *AssetImage) {
        cell.imgView.image = AssetImage;
    }];
    return cell;
}


-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumLineSpacing = kItemSpace;
        layout.minimumInteritemSpacing = kItemSpace;
        layout.itemSize = CGSizeMake(kItemW, kItemW);
        layout.sectionInset = UIEdgeInsetsMake(kItemSpace, kItemSpace, kItemSpace, kItemSpace);
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kSCreen_W, kSCreen_H) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.alwaysBounceVertical = YES;
        [_collectionView registerNib:[UINib nibWithNibName:@"PhotoCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"photoCell"];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end

