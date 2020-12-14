//
//  ServiceView.swift
//  SwiftUIObj
//
//  Created by Zhangxu on 2020/11/30.
//

/// 写我们想要的东西 每个类做成不同的服务 多用用Rx的东西

import SwiftUI

struct ServiceView: View {
    
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

struct ServiceView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ServiceView(title: "服务")
    }
}
