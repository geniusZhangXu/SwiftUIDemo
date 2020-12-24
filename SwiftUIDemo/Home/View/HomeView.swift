//
//  HomeView.swift
//  RxSwiftObj
//
//  Created by Zhangxu on 2020/11/30.
//

/// https://zhuanlan.zhihu.com/p/104027322

import SwiftUI

struct HomeView: View {
    
    /// viewModel
    private let homeViewModel:HomeViewModel = HomeViewModel()
    /// 导航标题
    var title:String
    /// 
    var body: some View {
        
        NavigationView{
            
            ScrollView(showsIndicators:false,content: {
        
                /// Banner视图
                HomeBannerView()
                    .environmentObject(homeViewModel)
                
                /// 服务列表
                HomeServiceCircleView().frame(
                   width: homeViewModel.homeServiceCircleWidth,
                  height: homeViewModel.homeServiceCircleHeight)
                    .environmentObject(homeViewModel)
                    .offset(y: -5)
                
                /// 滚动头条
                HomeCircleNewsView().frame(
                    width: homeViewModel.homeNewsCircleWidth,
                   height: homeViewModel.homeNewsCircleHeight)
                    .environmentObject(homeViewModel)
                
                /// 四个按钮
                HomeButtonView().frame(
                    width: homeViewModel.homeButtonViewWidth,
                   height: homeViewModel.homeButtonViewHeight)
                    .offset(y: -5)
                
                /// 服务列
                HomeServiceListView().frame(
                  width: homeViewModel.homeServiceViewWidth,
                 height: homeViewModel.homeServiceViewHeight)
                    .environmentObject(homeViewModel)
                
                /// 最美的风景
                HomeSnapshotView().environmentObject(homeViewModel)
            }).navigationTitle(title)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        HomeView(title: "首页")
    }
}
