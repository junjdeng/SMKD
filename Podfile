platform :ios, '8.0'
use_frameworks!

target 'SMApp' do
    
    
#****************** 基础框架使用原则 ********************

#1.更改工程名为对应项目名称，遵循驼峰命名原则，采用工程名的全拼
#2.所有Model必须继承BaseModel,Controller必须继承自BaseViewController
#3.QinzHttpRequest文件夹放置的是基础网络请求层，不允许放置其它文件
#4.Common层放置公用基础工具类文件
#5.Category层放置一些扩展类文件
#6.Config层放置宏文件、国际化配置文件等
#7.Vendor层放置不支持cocoapod导入的第三方库文件，同时引入每个库必须放在实体文件夹下
#8.Resources层放置Storyboard文件及图片资源文件，所有Storyboard文件必须放在该层
#9.Supporting Files放置的是入口函数文件，不允许放置其它文件
#10.Framework是引入的静态库和动态库文件，不允许放置其它文件


#================== 下面为常用第三方库Vendor文件夹下管理 ====================

#1.scan  二维码扫码库
#2.starView  星级点评库
#3.Masonry 约束库，这里主要是WMPlayer用到了
#4.WMPlayer 视频播放器
#5.TableViewZoom 针对TableView头部视图拉伸效果封装
#6.ShareSDK 分享库
#7.M13BadgeView 徽标库
#8.Pay 放置支付宝、微信、银联支付库
#9.SDPhotoBrowser 图片浏览
#10.SVProgressHUD  等待提示
#11. SDAutoLayout  布局类
#12. WRNavigationBar  改变导航栏样式

#================== 下面为常用第三方库cocoapods管理 ====================.

#布局类
pod 'SDAutoLayout'
#设置图像圆角 pod 'ZYCornerRadius'
#轮播图
pod 'SDCycleScrollView'
#键盘自动处理
pod 'IQKeyboardManager'
#模型解析
pod 'YYModel'
#提示信息
pod 'Toast'
#等待提示
pod 'MBProgressHUD'
#弹窗
pod 'JCAlertView'
#滚动带视图
pod 'VTMagic'
#徽标 pod 'RKNotificationHub'
#侧滑返回 #pod 'FDFullscreenPopGesture'
#网络请求
pod 'AFNetworking'
#图像处理
pod 'SDWebImage'
#上下拉刷新
pod 'MJRefresh'
#数据库操作
pod 'LKDBHelper'
#极光推送
pod 'JPush'
#弹出Alert、Sheet等
pod 'MMPopupView'
#自动计算tableView高度 pod 'UITableView+FDTemplateLayoutCell'
#图像处理 pod 'YYWebImage'


#================== 以下库如没用到需移除！====================

#自定义TabBar
pod 'CYLTabBarController'
#百度地图
pod 'BaiduMapKit'
#富文本
pod 'YYText'
#图像选择
pod 'TZImagePickerController'
#日历操作 pod 'FSCalendar'
#气泡弹窗 pod 'DXPopover'
#历史搜索记录 pod 'PYSearch'
#图表库 pod 'PNChart'
#图像裁切及旋转 pod 'PhotoTweaks'
#友盟第三方登录
pod 'UMengUShare/UI’
pod 'UMengUShare/Social/QQ'
pod 'UMengUShare/Social/WeChat'
#pod 'UMengUShare/Social/Sina'

#JP
pod 'ReactiveObjC' 
end
