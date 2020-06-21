#import <UIKit/UIKit.h>
#import "QMSettingModel.h"
@interface QMSettingTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UISwitch *switcher;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
- (void)setSettingModelType:(QMSettingType)type;
@end
