//
//  Interface.h
//  网络考试Demo
//
//  Created by wuyiguang on 2016/10/17.
//  Copyright © 2016年 YG. All rights reserved.
//

#ifndef Interface_h
#define Interface_h

// 总cell详情 id = %@
#define kCellURL @"http://open3.bantangapp.com/topic/newInfo?app_id=com.jzyd.JuYouPin&app_installtime=1477292158&app_versions=5.8.1&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&id=%@&oauth_token=6accb3009df562410eaeda6bee23ba0e&os_versions=10.0.1&screensize=640&statistics_uv=0&track_deviceid=AC30521C-6D0D-4F82-9051-54B21892772B&track_user_id=2693464&type_id=1&v=13"

// 搜索 - 单品
#define kSearchSingleURL @"http://open3.bantangapp.com/category/list?app_id=com.jzyd.JuYouPin&app_installtime=1477292158&app_versions=5.8.1&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&is_new=1&oauth_token=2bfa86e00ed0d66ca19b2a0964814c4b&os_versions=10.0.1&screensize=640&track_device_info=iPhone5%2C2&track_deviceid=AC30521C-6D0D-4F82-9051-54B21892772B&track_user_id=2693464&v=13"

// 单品 - 标签
#define kSingleButtonURl @"http://open3.bantangapp.com/category/subclassInfo?app_id=com.jzyd.JuYouPin&app_installtime=1477292158&app_versions=5.8.1&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&id=%@&oauth_token=6accb3009df562410eaeda6bee23ba0e&os_versions=10.0.1&screensize=640&track_deviceid=AC30521C-6D0D-4F82-9051-54B21892772B&track_user_id=2693464&v=13"


// 单品 - 列表
#define kSingleListURl @"http://open3.bantangapp.com/search/product/listBySubclass?app_id=com.jzyd.JuYouPin&app_installtime=1477292158&app_versions=5.8.1&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&id=%@&oauth_token=6accb3009df562410eaeda6bee23ba0e&os_versions=10.0.1&screensize=640&sort_type=%d&track_deviceid=AC30521C-6D0D-4F82-9051-54B21892772B&track_user_id=2693464&v=13"

// 单品列表 - 详情
#define kSingleListDetailURL @"http://open3.bantangapp.com/product/newInfo?app_id=com.jzyd.JuYouPin&app_installtime=1477292158&app_versions=5.8.1&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&comments_pagesize=10&id=%@&oauth_token=6accb3009df562410eaeda6bee23ba0e&os_versions=10.0.1&screensize=640&track_deviceid=AC30521C-6D0D-4F82-9051-54B21892772B&track_user_id=2693464&v=13"



// 搜索 - 清单
#define kSearchListURL @"http://open3.bantangapp.com/category/scene?app_id=com.jzyd.JuYouPin&app_installtime=1477292158&app_versions=5.8.1&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&oauth_token=2bfa86e00ed0d66ca19b2a0964814c4b&os_versions=10.0.1&screensize=640&track_device_info=iPhone5%2C2&track_deviceid=AC30521C-6D0D-4F82-9051-54B21892772B&track_user_id=2693464&v=13"

// 清单 - 详情 id = %@ , sort_type = %@
#define kListUpdataURL @"http://open3.bantangapp.com/search/topic/listByScene?app_id=com.jzyd.JuYouPin&app_installtime=1477292158&app_versions=5.8.1&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&id=%@&oauth_token=6accb3009df562410eaeda6bee23ba0e&os_versions=10.0.1&page=0&pagesize=20&screensize=640&sort_type=0&track_deviceid=AC30521C-6D0D-4F82-9051-54B21892772B&track_user_id=2693464&v=13"

#define kListHotURL @"http://open3.bantangapp.com/search/topic/listByScene?app_id=com.jzyd.JuYouPin&app_installtime=1477292158&app_versions=5.8.1&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&id=%@&oauth_token=6accb3009df562410eaeda6bee23ba0e&os_versions=10.0.1&page=0&pagesize=20&screensize=640&sort_type=1&track_deviceid=AC30521C-6D0D-4F82-9051-54B21892772B&track_user_id=2693464&v=13"

/**
 首页1
 */
#define kHomeURL1 @"http://open3.bantangapp.com/recommend/index?app_id=com.jzyd.JuYouPin&app_installtime=1477292158&app_versions=5.8.1&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&last_get_time=1477293460&oauth_token=13ed6b6c7a71b73e51b206ea5bba5558&os_versions=10.0.1&page=0&pagesize=20&screensize=640&track_device_info=iPhone5%2C2&track_deviceid=AC30521C-6D0D-4F82-9051-54B21892772B&track_user_id=2693464&v=13"

/**
 首页2
 */
#define kHomeURL2 @"http://open3.bantangapp.com/topics/topic/listByIds?app_id=com.jzyd.JuYouPin&app_installtime=1477292158&app_versions=5.8.1&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&ids=12605%2C11811%2C12058%2C12725%2C12582%2C12734%2C12752%2C12588%2C12485%2C12777%2C12544%2C12433%2C12659%2C12697%2C12392%2C12702%2C12384%2C12322%2C12426%2C12314%2C12164%2C12340%2C12537%2C12570%2C12521%2C12361%2C12516%2C12465%2C12031%2C12467%2C11769%2C12442%2C12165%2C11826%2C12412%2C12104%2C12375%2C12139%2C12305%2C11763%2C11602%2C12110%2C12137%2C12074%2C12065%2C12161%2C11983%2C12244%2C11890%2C11669&oauth_token=13ed6b6c7a71b73e51b206ea5bba5558&os_versions=10.0.1&page=0&pagesize=20&screensize=640&track_device_info=iPhone5%2C2&track_deviceid=AC30521C-6D0D-4F82-9051-54B21892772B&track_user_id=2693464&v=13"

/**
 首页3
 */
#define kHomeURL3 @"http://open3.bantangapp.com/topics/topic/listByIds?app_id=com.jzyd.JuYouPin&app_installtime=1477292158&app_versions=5.8.1&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&ids=12659%2C12322%2C12640%2C12720%2C12654%2C12545%2C12295%2C12718%2C12777%2C12433%2C12626%2C12702%2C12582%2C12743%2C12426%2C12648%2C12537%2C12392%2C12655%2C12749&oauth_token=13ed6b6c7a71b73e51b206ea5bba5558&os_versions=10.0.1&page=0&pagesize=20&screensize=640&track_device_info=iPhone5%2C2&track_deviceid=AC30521C-6D0D-4F82-9051-54B21892772B&track_user_id=2693464&v=13"

/**
 首页4
 */
#define kHomeURL4 @"http://open3.bantangapp.com/topics/topic/listByScene?app_id=com.jzyd.JuYouPin&app_installtime=1477292158&app_versions=5.8.1&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&id=13&oauth_token=13ed6b6c7a71b73e51b206ea5bba5558&os_versions=10.0.1&page=0&pagesize=20&screensize=640&track_device_info=iPhone5%2C2&track_deviceid=AC30521C-6D0D-4F82-9051-54B21892772B&track_user_id=2693464&v=13"

/**
 首页5
 */
#define kHomeURL5 @"http://open3.bantangapp.com/topics/topic/listByScene?app_id=com.jzyd.JuYouPin&app_installtime=1477292158&app_versions=5.8.1&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&id=3&oauth_token=13ed6b6c7a71b73e51b206ea5bba5558&os_versions=10.0.1&page=0&pagesize=20&screensize=640&track_device_info=iPhone5%2C2&track_deviceid=AC30521C-6D0D-4F82-9051-54B21892772B&track_user_id=2693464&v=13"

/**
 首页6
 */
#define kHomeURL6 @"http://open3.bantangapp.com/topics/topic/listByScene?app_id=com.jzyd.JuYouPin&app_installtime=1477292158&app_versions=5.8.1&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&id=15&oauth_token=13ed6b6c7a71b73e51b206ea5bba5558&os_versions=10.0.1&page=0&pagesize=20&screensize=640&track_device_info=iPhone5%2C2&track_deviceid=AC30521C-6D0D-4F82-9051-54B21892772B&track_user_id=2693464&v=13"

/**
 首页7
 */
#define kHomeURL7 @"http://open3.bantangapp.com/topics/topic/listByScene?app_id=com.jzyd.JuYouPin&app_installtime=1477292158&app_versions=5.8.1&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&id=16&oauth_token=13ed6b6c7a71b73e51b206ea5bba5558&os_versions=10.0.1&page=0&pagesize=20&screensize=640&track_device_info=iPhone5%2C2&track_deviceid=AC30521C-6D0D-4F82-9051-54B21892772B&track_user_id=2693464&v=13"

/**
 首页8
 */
#define kHomeURL8 @"http://open3.bantangapp.com/topics/topic/listByScene?app_id=com.jzyd.JuYouPin&app_installtime=1477292158&app_versions=5.8.1&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&id=8&oauth_token=13ed6b6c7a71b73e51b206ea5bba5558&os_versions=10.0.1&page=0&pagesize=20&screensize=640&track_device_info=iPhone5%2C2&track_deviceid=AC30521C-6D0D-4F82-9051-54B21892772B&track_user_id=2693464&v=13"

/**
 首页9
 */
#define kHomeURL9 @"http://open3.bantangapp.com/topics/topic/listByScene?app_id=com.jzyd.JuYouPin&app_installtime=1477292158&app_versions=5.8.1&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&id=5&oauth_token=13ed6b6c7a71b73e51b206ea5bba5558&os_versions=10.0.1&page=0&pagesize=20&screensize=640&track_device_info=iPhone5%2C2&track_deviceid=AC30521C-6D0D-4F82-9051-54B21892772B&track_user_id=2693464&v=13"

/**
 清单 - 最热
 */
#define kHotURL @"http://open3.bantangapp.com/topics/topic/listByUsers?app_id=com.jzyd.JuYouPin&app_installtime=1477292158&app_versions=5.8.1&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&oauth_token=13ed6b6c7a71b73e51b206ea5bba5558&os_versions=10.0.1&page=%d&pagesize=20&screensize=640&sort_type=1&track_deviceid=AC30521C-6D0D-4F82-9051-54B21892772B&track_user_id=2693464&v=13"

/**
 清单 - 最新
 */
#define kUpDataURL @"http://open3.bantangapp.com/topics/topic/listByUsers?app_id=com.jzyd.JuYouPin&app_installtime=1477292158&app_versions=5.8.1&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&oauth_token=13ed6b6c7a71b73e51b206ea5bba5558&os_versions=10.0.1&page=%d&pagesize=20&screensize=640&sort_type=0&track_deviceid=AC30521C-6D0D-4F82-9051-54B21892772B&track_user_id=2693464&v=13"

/**
 单品 - 分类
 */
#define kCategoryURL @"http://open3.bantangapp.com/community/post/index?app_id=com.jzyd.JuYouPin&app_installtime=1477292158&app_versions=5.8.1&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&oauth_token=13ed6b6c7a71b73e51b206ea5bba5558&os_versions=10.0.1&screensize=640&track_device_info=iPhone5%2C2&track_deviceid=AC30521C-6D0D-4F82-9051-54B21892772B&track_user_id=2693464&v=13"

/**
 单品 - 热门推荐
 */
#define kRecommenedURL @"http://open3.bantangapp.com/community/post/hotRecommend?app_id=com.jzyd.JuYouPin&app_installtime=1477292158&app_versions=5.8.1&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&oauth_token=13ed6b6c7a71b73e51b206ea5bba5558&os_versions=10.0.1&page=0&pagesize=18&screensize=640&track_device_info=iPhone5%2C2&track_deviceid=AC30521C-6D0D-4F82-9051-54B21892772B&track_user_id=2693464&v=13"

// 分类 - cell id = %@

#define kCategoryCellURL @"http://open3.bantangapp.com/community/post/listByCategory?app_id=com.jzyd.JuYouPin&app_installtime=1477292158&app_versions=5.8.1&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&id=%@&oauth_token=6accb3009df562410eaeda6bee23ba0e&os_versions=10.0.1&page=%d&pagesize=10&screensize=640&track_deviceid=AC30521C-6D0D-4F82-9051-54B21892772B&track_user_id=2693464&type_id=1&v=13"

//  分类Cell -详情
#define kCategoryDetailURL @"http://open3.bantangapp.com/community/post/info?app_id=com.jzyd.JuYouPin&app_installtime=1477292158&app_versions=5.8.1&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&comments_pagesize=10&id=%@&oauth_token=6accb3009df562410eaeda6bee23ba0e&os_versions=10.0.1&screensize=640&track_deviceid=AC30521C-6D0D-4F82-9051-54B21892772B&track_user_id=2693464&v=13"

// 左边列表
#define kListURL @"http://open3.bantangapp.com/community/post/communityHome?app_id=com.jzyd.JuYouPin&app_installtime=1477292158&app_versions=5.8.1&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&oauth_token=b2b6883a615e74313ba8a8eb21c138d8&os_versions=10.1.1&screensize=640&track_deviceid=AC30521C-6D0D-4F82-9051-54B21892772B&track_user_id=2724436&v=13"

#endif /* Interface_h */

