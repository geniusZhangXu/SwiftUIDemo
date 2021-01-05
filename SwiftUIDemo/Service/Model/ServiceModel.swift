//
//  ServiceModel.swift
//  SwiftUIDemo
//
//  Created by Zhangxu on 2020/12/28.
//

import SwiftUI

struct ServiceModel: Hashable, Codable, Identifiable{
   
    var id: Int
    /// 组名
    var sectionTitle: String
    /// 该组服务item组内容
    var serviceArray:Array<Array<BaseServiceModel>>
    
}
