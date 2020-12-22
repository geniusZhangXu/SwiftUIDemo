//
//  HomeServicePageView.swift
//  SwiftUIDemo
//
//  Created by Zhangxu on 2020/12/22.
//

import SwiftUI

struct HomeServicePageView: View {
    
    /// 第几页
    var pageIndex:Int
    /// 再根据viewModel的返回值设置相应数据
    @EnvironmentObject var homeViewModel: HomeViewModel

    var body: some View {
        
        VStack{
            
            HStack{
                
                ForEach(0..<5){
                    
                    let index = IndexPath(row: $0, section: pageIndex)
                    BaseServiceView(serviceName:homeViewModel.serviceCircleImage(index),serviceImage:
                        homeViewModel.serviceCircleName(index))
                }
            }
            
            HStack{
                
                ForEach(5..<10){
                    
                    let index = IndexPath(row: $0, section: pageIndex)
                    BaseServiceView(serviceName:homeViewModel.serviceCircleImage(index),serviceImage:
                        homeViewModel.serviceCircleName(index))
                }
            }
        }
    }
}

struct HomeServicePageView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        HomeServicePageView(pageIndex: 0).environmentObject(HomeViewModel())
    }
}
