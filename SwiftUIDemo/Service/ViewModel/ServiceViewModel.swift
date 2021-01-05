//
//  ServiceViewModel.swift
//  SwiftUIDemo
//
//  Created by Zhangxu on 2020/12/28.
//

import SwiftUI

final class ServiceViewModel: ObservableObject {
    
    
    public let sectionListWidth:CGFloat  = 90.0
    public let sectionScrollWidth:CGFloat  = kScreenWidth - 90.0
    
    private var sectionScrollOffSetY:CGFloat = 0.0
    
    /// 服务modelArray
    @Published var serviceModelArray:Array<ServiceModel> = load("ServiceData.json")
    
}

extension ServiceViewModel{
    
    ///
    /// - Parameter indexPath: indexPath description
    /// - Returns: description
    func sectionScrollHeight(_ indexPath:NSInteger) -> CGFloat {
        
        return CGFloat((serviceModelArray[indexPath].serviceArray.count * 85) + 60)
    }
    
}
