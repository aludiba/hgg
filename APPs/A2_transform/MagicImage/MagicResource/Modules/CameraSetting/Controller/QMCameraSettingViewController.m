#import "QMCameraSettingViewController.h"
#import <Masonry.h>
#import "QMSettingModel.h"
#import "UIColor+Additions.h"
#import "QMSettingTableViewCell.h"
@interface QMCameraSettingViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSDictionary<NSNumber *, NSArray<QMSettingModel *> *> *settingModels;
@end
@implementation QMCameraSettingViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupUI];
    [self setupDatas];
}
- (BOOL)prefersStatusBarHidden
{
    return NO;
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}
- (void)setupUI
{
    self.view.backgroundColor = [UIColor colorWithRGBHex:0xF7F8F8];
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectZero];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"Setting";
    title.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.height.mas_equalTo(60);
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
        make.top.mas_equalTo(15);
    }];
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    [backBtn setImage:[UIImage imageNamed:@"qm_setting_back_btn"] forState:UIControlStateNormal];
    [self.view addSubview:backBtn];
    [backBtn addTarget:self action:@selector(backBtnTapped:) forControlEvents:UIControlEventTouchUpInside];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(25);
        make.top.mas_equalTo(35);
        make.left.mas_offset(10);
    }];
    UIView *titleSlider = [[UIView alloc] initWithFrame:CGRectZero];
    titleSlider.backgroundColor = [UIColor colorWithRGBHex:0xebedee];
    [self.view addSubview:titleSlider];
    [titleSlider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(70);
    }];
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.rowHeight = 55;
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.separatorColor = [UIColor colorWithRGBHex:0xebedee];
    [tableView registerNib:[UINib nibWithNibName:@"QMSettingTableViewCell" bundle:nil] forCellReuseIdentifier:@"QMSettingTableViewCell"];
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(10);
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(titleSlider.mas_bottom).mas_equalTo(0);
    }];
}
- (void)setupDatas
{
    _settingModels = [QMSettingModel buildSettingModels];
}
#pragma mark - Event
- (void)backBtnTapped:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _settingModels.count;
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _settingModels[@(section)].count;;
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    QMSettingModel *model = _settingModels[@(indexPath.section)][indexPath.row];
    QMSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QMSettingTableViewCell"];
    [cell setSettingModelType:model.settingType];
    cell.label.text = model.name;
    cell.switcher.on = model.switchOn;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
@end
