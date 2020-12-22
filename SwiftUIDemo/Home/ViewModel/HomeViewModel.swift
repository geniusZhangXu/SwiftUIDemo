//
//  HomeViewModel.swift
//  SwiftUIDemo
//
//  Created by Zhangxu on 2020/12/22.
//

import Foundation
import SwiftUI

final class HomeViewModel: ObservableObject {
    
    /// 服务Banner-Size
    public let homeBannerWidth  = kScreenWidth - 30
    public let homeBannerHeight:CGFloat = 150
    
    /// 服务Circle-Size
    public let homeServiceCircleWidth  = kScreenWidth
    public let homeServiceCircleHeight:CGFloat = 180.0
    
    /// 服务列表Size
    public let homeServiceViewWidth  = kScreenWidth - 30
    public let homeServiceViewHeight:CGFloat = 130.0

    /// 四个按钮Size
    public let homeButtonViewWidth  = kScreenWidth - 30
    public let homeButtonViewHeight:CGFloat = 70.0
    
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

