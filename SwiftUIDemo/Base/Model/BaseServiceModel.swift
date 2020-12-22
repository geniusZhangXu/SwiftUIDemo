//
//  BaseServiceModel.swift
//  SwiftUIDemo
//
//  Created by Zhangxu on 2020/12/22.
//  

import Foundation

/// Service Model
struct BaseServiceModel: Hashable, Codable, Identifiable  {
    
    /// 这个ID很有意思，后面总结，这里要不加这个ID会报错，可以试试
    var id: Int
    var imageName: String
    var serviceName: String
}

