//
//  AroundModel.swift
//  SwiftUIDemo
//
//  Created by Zhangxu on 2020/12/24.
//

import Foundation

struct UserLocation: Hashable, Codable, Identifiable{
   
    var id: Int
    var latitude: Double
    var longitude: Double
    var location:String
}
