//
//  AroundView.swift
//  RxSwiftObj
//
//  Created by Zhangxu on 2020/11/30.
//

/// 导入地图

import SwiftUI

struct AroundView: View {
    
    /// 标题
    var title:String

    var body: some View {
        
        NavigationView{
            
            NavigationLink.init(
                destination: Text("Destination"),
                label: {
                    Text("Navigate")
                })
                .navigationTitle(title)
            
        }
    }
}

struct AroundView_Previews: PreviewProvider {
    
    static var previews: some View {
        AroundView(title: "服务")
    }
}
