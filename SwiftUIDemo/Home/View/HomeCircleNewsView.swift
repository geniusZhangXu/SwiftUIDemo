//
//  HomeCircleNewsView.swift
//  SwiftUIDemo
//
//  Created by Zhangxu on 2020/12/21.
//  Jetpack Compose 安卓全新的UI开发框架

import SwiftUI

struct HomeCircleNewsView: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    ///
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    ///当前显示的位置索引,
    ///这是实际数据中的1就是数据没有被处理之前的0位置的图片
    ///所以这里默认从1开始
    @State var currentIndex: Int = 1
    /// 是否需要动画
    /// @State var isAnimation: Bool = true

    let spacing: CGFloat = 10
    
    var body: some View {
        
        let currentOffset = CGFloat(currentIndex) * (homeViewModel.homeNewsCircleHeight + spacing)
        ///
        GeometryReader(content: { geometry in
            
            VStack(spacing:spacing){
                
                ForEach(0..<homeViewModel.homeNewsCount()){index in
                    
                    VStack(alignment:.leading){
                        
                        let firstIndex = IndexPath(row: 0, section: index)
                        Text(homeViewModel.homeNewsTitle(firstIndex))
                             .frame(height: geometry.size.height/2)
                            .font(.system(size: 14))
                        
                        let secondIndex = IndexPath(row: 1,section: index)
                        Text(homeViewModel.homeNewsTitle(secondIndex))
                            .frame(height: geometry.size.height/2)
                            .font(.system(size: 14))
                    }
                }
            }.frame(width: geometry.size.width,
                   height: geometry.size.height)
            .offset(y:homeViewModel.homeNewsDefaultOffSetY() - currentOffset)
            ///.animation(isAnimation ? .spring() : .none)
            .onChange(of: currentIndex, perform: { value in
                
                ///isAnimation = true
                if currentIndex == 0 {
                    
                    ///isAnimation.toggle()
                    currentIndex = homeViewModel.homeNewsCount() - 2
                }else if currentIndex == homeViewModel.homeNewsCount() - 1{
                    
                    ///isAnimation.toggle()
                    currentIndex = 1
                }
            })
            .onReceive(timer, perform: { _ in
                
                currentIndex += 1
            })
        }).frame(width: homeViewModel.homeNewsCircleWidth,
                height: homeViewModel.homeNewsCircleHeight)
          .clipped() /// 裁减
    }
}



struct HomeCircleNewsView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        HomeCircleNewsView().environmentObject(HomeViewModel())
    }
}
