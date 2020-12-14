//
//  MineModel.swift
//  RxSwiftObj
//
//  Created by Zhangxu on 2020/12/2.
//

import Foundation

/// item Model
struct MineLiseModel: Hashable, Codable, Identifiable  {
    
    var id: Int
    var imageName: String
    var listName: String
}

final class NavigationAction: ObservableObject  {
    
    @Published var mineLiseModels = mineListData
    
}
