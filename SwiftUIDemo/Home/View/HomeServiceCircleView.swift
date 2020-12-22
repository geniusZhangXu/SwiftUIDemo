//
//  HomeServiceCircleView.swift
//  SwiftUIDemo
//
//  Created by Zhangxu on 2020/12/21.
//

import SwiftUI

struct HomeServiceCircleView: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    /// 轮播滚动又用到TabView
    @State private var selection = 0
    
    var body: some View {
        
        TabView(selection: $selection) {
            
            ForEach(0..<3){
                
                HomeServicePageView(pageIndex: $0)
                    .tag($0)
                    .environmentObject(homeViewModel)
            }
        }
        /// PageTabViewStyle 14.0的新东西
        .tabViewStyle(PageTabViewStyle())
        .animation(.spring())
    }
}

struct HomeServiceCircleView_Previews: PreviewProvider {
    static var previews: some View {
        HomeServiceCircleView()
    }
}
