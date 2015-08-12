//
//  CSIIViewController.m
//  ScrollView
//
//  Created by Hu Di on 13-10-11.
//  Copyright (c) 2013年 Sanji. All rights reserved.
//

#import "HDViewController.h"

@interface HDViewController ()
{
    NSMutableArray *imageArray;
    HDScrollview *_scrollview;
}
@end

@implementation HDViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        imageArray=[NSMutableArray arrayWithCapacity:1];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@",[[UIDevice currentDevice] systemVersion]);
    if ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0) {
        self.edgesForExtendedLayout=UIRectEdgeNone;
    }
    CGRect bound=CGRectMake(0, 0, 320, 150);
    NSArray *color=[[NSArray alloc]initWithObjects:[UIColor redColor],[UIColor brownColor],[UIColor blueColor],[UIColor lightGrayColor], nil];
//    for (int i=0; i<color.count; i++) {
//        UIImageView *imageview=[[UIImageView alloc]init];
//        imageview.backgroundColor=[color objectAtIndex:i];
//        [imageArray addObject:imageview];
//    }
    NSArray *ImageArr=@[[UIImage imageNamed:@"Expression_1"],[UIImage imageNamed:@"Expression_2"],[UIImage imageNamed:@"Expression_3"],[UIImage imageNamed:@"Expression_4"]];
    for (int i=0; i<ImageArr.count; i++) {
        UIImageView *imageview=[[UIImageView alloc]init];
        imageview.backgroundColor=[color objectAtIndex:i];
        imageview.image=[ImageArr objectAtIndex:i];
        imageview.contentMode=UIViewContentModeScaleAspectFit;
        //可以自定义imageview
        if (i%2==0) {
            UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame=CGRectMake(0, 10, 150, 30);
            NSString *title=[NSString stringWithFormat:@"按钮%d",i];
            [btn setTitle:title forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(BTNCLICK:) forControlEvents:UIControlEventTouchDown];
            [imageview addSubview:btn];
        }
        else
        {
            UITextField *textField=[[UITextField alloc]initWithFrame:CGRectMake(10, 40, 60, 20)];
            textField.borderStyle=UITextBorderStyleRoundedRect;
            [imageview addSubview:textField];
        }
        [imageArray addObject:imageview];
    }
    //_scrollview=[[HDScrollview alloc]initWithFrame:bound withImageView:imageArray];
    _scrollview=[[HDScrollview alloc]initLoopScrollWithFrame:bound withImageView:imageArray];
    _scrollview.delegate=self;
    _scrollview.HDdelegate=self;
    [self.view addSubview:_scrollview];
    _scrollview.pagecontrol.frame=CGRectMake(0, _scrollview.pagecontrol.frame.origin.y+_scrollview.frame.size.height-10, 320, 10);
    _scrollview.pagecontrol.currentcolor=[UIColor blackColor];
    _scrollview.pagecontrol.othercolor=[UIColor whiteColor];
    _scrollview.pagecontrol.currentPage=0;
    [self.view addSubview:_scrollview.pagecontrol];
}

-(void)viewDidAppear:(BOOL)animated
{

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)BTNCLICK:(UIButton *)sender
{
    NSLog(@"%@",sender.titleLabel.text);
}
#pragma mark ==========UIScrollViewDelegate============

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    [_scrollview HDscrollViewDidScroll];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)_scrollView
{
    [_scrollview HDscrollViewDidEndDecelerating];
}
-(void)TapView:(int)index
{
    NSLog(@"点击了第%d个页面",index);
    //下面可以根据自己的需求操作
    //Example
    if (imageArray.count>1) {
        //删除一个
        [imageArray removeObjectAtIndex:index];
        //_scrollview=[_scrollview initWithFrame:_scrollview.frame withImageView:imageArray];
        
        _scrollview=[_scrollview initLoopScrollWithFrame:_scrollview.frame withImageView:imageArray];
        _scrollview.pagecontrol.currentPage=index;
        
    }
}
@end
