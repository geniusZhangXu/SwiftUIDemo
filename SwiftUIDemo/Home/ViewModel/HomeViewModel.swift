//
//  HomeViewModel.swift
//  SwiftUIDemo
//
//  Created by Zhangxu on 2020/12/22.
//

import Foundation
import SwiftUI

final class HomeViewModel: ObservableObject {
    
    /// Banner-Size
    public let homeBannerWidth  = kScreenWidth - 30
    public let homeBannerHeight:CGFloat = 150
    
    /// 服务Circle-Size
    public let homeServiceCircleWidth  = kScreenWidth
    public let homeServiceCircleHeight:CGFloat = 190.0
    
    /// 服务列表Size
    public let homeServiceViewWidth  = kScreenWidth - 30
    public let homeServiceViewHeight:CGFloat = 120.0

    /// 四个按钮Size
    public let homeButtonViewWidth  = kScreenWidth - 30
    public let homeButtonViewHeight:CGFloat = 65.0
    
    /// CircleNews-Size
    public let homeNewsCircleWidth  = kScreenWidth - 30
    public let homeNewsCircleHeight:CGFloat = 50
    
    /// 首页Model
    private let homeModel:HomeModel = load("HomeData.json")
    ///
    private var homeBannerArray:Array<String>{
        /*
         (lldb) po homeBannerArray
         ▿ 7 elements
           - 0 : "lakemcdonald"
           - 1 : "twinlake"
           - 2 : "umbagog"
           - 3 : "stmarylake"
           - 4 : "silversalmoncreek"
           - 5 : "lakemcdonald"
           - 6 : "twinlake"
         */
        return [homeModel.bannerImages.last!] + homeModel.bannerImages +
               [homeModel.bannerImages.first!]
    }
    
    /// 新闻循环数据
    private var homeNewsArray:Array<Array<String>>{
        
        return [homeModel.newsArray.last!] + homeModel.newsArray +
               [homeModel.newsArray.first!]
    }
}

// MARK: -
extension HomeViewModel{
    
    /// banner个数
    /// - Returns: description
    func homeBannerCount() -> NSInteger {
        
        return homeBannerArray.count
    }
    
    /// banner 图片
    /// - Parameter indexPath: indexPath description
    /// - Returns: description
    func bannerImage(_ indexPath:NSInteger) -> String {
        
        return homeBannerArray[indexPath]
    }
}


// MARK: - news
extension HomeViewModel{
    
    ///
    /// - Returns: description
    func homeNewsCount() -> NSInteger {
        
        return homeNewsArray.count
    }
    
    ///
    /// - Parameter indexPath: indexPath description
    /// - Returns: description
    func homeNewsTitle(_ indexPath:IndexPath) -> String {
        
        let newsArray = homeNewsArray[indexPath.section]
        return newsArray[indexPath.row]
    }
    
    /// 默认的偏移index
    /// - Returns: description
    func homeNewsDefaultOffSetY() -> CGFloat {
    
        /// 偶数
        if (homeNewsArray.count % 2) == 0 {
            
            let offsetIndex = CGFloat((homeNewsArray.count - 3)/2)
            /// 10 是默认的mews之间间隔
            return (offsetIndex * homeNewsCircleHeight) + (offsetIndex * 10)
        /// 奇数
        }else{
            
            let offsetIndex = CGFloat((homeNewsArray.count - 1)/2)
            return ((offsetIndex - 0.5) * homeNewsCircleHeight) + ((offsetIndex - 0.5) * 10) + (0.5 * homeNewsCircleHeight)
        }
    }
    
}

// MARK: -
extension HomeViewModel{
    
    /// 服务Circle image
    /// - Parameter indexPath: indexPath description
    /// - Returns: description
    func serviceCircleImage(_ indexPath:IndexPath) -> String {
        
        let pageArray = homeModel.serviceCircle[indexPath.section]
        let model = pageArray[indexPath.row]
        return model.imageName
    }
    
    /// 服务Circle name
    /// - Parameter indexPath: indexPath description
    /// - Returns: description
    func serviceCircleName(_ indexPath:IndexPath) -> String {
        
        let pageArray = homeModel.serviceCircle[indexPath.section]
        let model = pageArray[indexPath.row]
        return model.serviceName
    }
    
}

// MARK: -
extension HomeViewModel{
    
    /// 服务列表个数
    /// - Returns: description
    func serviceListCount() -> NSInteger {
        
        return homeModel.serviceList.count
    }
    /// 服务列表名称
    /// - Parameter indexPath: indexPath description
    /// - Returns: description
    func serviceListName(_ indexPath:NSInteger) -> String {
        
        let model = homeModel.serviceList[indexPath]
        return model.serviceName
    }
    
    /// 服务列表图片
    /// - Parameter indexPath: indexPath description
    /// - Returns: description
    func serviceListImage(_ indexPath:NSInteger) -> String {
        
        let model = homeModel.serviceList[indexPath]
        return model.imageName
    }
}

// MARK: -
extension HomeViewModel{
    
    ///
    /// - Returns: description
    func snapshotCount() -> NSInteger {
        
        return homeModel.snapshotList.count
    }
    /// snapshot名称
    /// - Parameter indexPath: indexPath description
    /// - Returns: description
    func snapshotName(_ indexPath:NSInteger) -> String {
        
        let model = homeModel.snapshotList[indexPath]
        return model.snapshotName
    }
    
    /// snapshot图片
    /// - Parameter indexPath: indexPath description
    /// - Returns: description
    func snapshotImage(_ indexPath:NSInteger) -> String {
        
        let model = homeModel.snapshotList[indexPath]
        return model.imageName
    }
}

