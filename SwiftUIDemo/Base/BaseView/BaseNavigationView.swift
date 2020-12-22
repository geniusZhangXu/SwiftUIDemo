//
//  BaseNavigationView.swift
//  RxSwiftObj
//
//  Created by Zhangxu on 2020/11/30.
//

import SwiftUI

struct BaseNavigationView: View {
    
    var title:String
    
    var body: some View {
        
        NavigationView{
            
            NavigationLink.init(
                destination: Text("Destination"),
                label: {
                    Text("Navigate")
                })
                .navigationTitle(title)
                /// 留意下这个显示模式 displayMode 分三种，具体的可以点进去看看
                /// inline 就是我们常见的模式
                /// .navigationBarTitle(title,displayMode: .inline)
        }
    }
}

struct BaseNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        
        BaseNavigationView(title: "")
    }
}
