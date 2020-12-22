//
//  HomeModel.swift
//  SwiftUIDemo
//
//  Created by Zhangxu on 2020/12/21.
//

import Foundation

struct HomeModel: Hashable, Codable, Identifiable  {
    
    var id: Int
    ///
    var bannerImages: Array<String>
    /// 服务列表数据
    var serviceList: Array<BaseServiceModel>
    /// 服务Circle数据
    var serviceCircle: Array<Array<BaseServiceModel>>
    /// 最美风景
    var snapshotList: Array<SnapshotModel>

}

/// Service Model
struct SnapshotModel: Hashable, Codable, Identifiable  {
    
    var id: Int
    var imageName: String
    var snapshotName: String
}

