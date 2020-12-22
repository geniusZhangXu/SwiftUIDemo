//
//  MarcoUtils.swift
//  WisdomFN
//
//  Created by Zhangxu on 2020/7/10.
//  Copyright © 2020 Zhangxu. All rights reserved.
//


import UIKit
import Foundation

/// delegate 和 window
let kAppDelegate     = UIApplication.shared.delegate
let kDelegateWindow  = kAppDelegate?.window

/// 宽高
let kScreenWidth     = UIScreen.main.bounds.size.width
let kScreenHeight    = UIScreen.main.bounds.size.height

/// NavigationBar高度
let kNavigationBarHeight:CGFloat = 44.0

/// 状态栏高度
let kStatusBarHeight = UIApplication.shared.statusBarFrame.size.height
/// 状态栏高度 + NavigationBar高度
let kTopHeight       = kStatusBarHeight + kNavigationBarHeight

/// TabBar高度
let kTabBarHight : CGFloat = 49.0
/// 安全区域
let kSafeArea : CGFloat = kScreenHeight >= 812 ? 34.0 : 0
/// TabBar高度 + 安全区域
let kBottomHeight : CGFloat = kTabBarHight + kSafeArea
/// 控制器contentView的高度
let kContentViewHeight = kScreenHeight - kTopHeight - kBottomHeight
/// 控制器contentView+底部标签的高度
let kContentViewAndBottomViewHeight = kScreenHeight - kTopHeight

/// 默认的圆角Size
let kDefaultCornerRadii:  CGSize  = CGSize(width: 4, height: 4)
/// 默认圆角的大小
let kDefaultCornerRadius: CGFloat = 4
/// 默认的两边距离
let kDefaultBackgauge: CGFloat    = 15
/// 缩放系数
let scale : CGFloat = ratio
/// 获取适配pt值
func kFit(_ value : CGFloat)->CGFloat {
    return value * scale;
}
/// 适配系数
let ratio : CGFloat = {
    
    let fullWidth : CGFloat = kScreenWidth > kScreenHeight ? kScreenHeight : kScreenWidth
    var scale : CGFloat = 0.0
    if fullWidth == 375.0 {
        scale = 1.0
    }else if fullWidth >= 414.0 {
        scale = 1.1
    }else{
        scale = 0.85
    }
    return scale;
}()


