//
//  HomeView.swift
//  RxSwiftObj
//
//  Created by Zhangxu on 2020/11/30.
//

import SwiftUI

struct HomeView: View {
    
    /// 标题
    var title:String

    var body: some View {
        
        NavigationView{
            
            NavigationLink.init(
                destination: Text("Destination"),
                label: {
                    Text("我是首页")
                })
                .navigationTitle(title)
        
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        HomeView(title: "首页")
    }
}
