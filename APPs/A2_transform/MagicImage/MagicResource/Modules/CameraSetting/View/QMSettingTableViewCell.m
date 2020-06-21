#import "QMSettingTableViewCell.h"
@implementation QMSettingTableViewCell
- (void)awakeFromNib
{
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.switcher.transform = CGAffineTransformMakeScale(0.9, 0.9);
}
- (void)setSettingModelType:(QMSettingType)type
{
    if (type == QMSettingTypeLink) {
        self.switcher.hidden = YES;
    }else if (type == QMSettingTypeSwitch) {
        self.switcher.hidden = NO;
    }
}
@end
