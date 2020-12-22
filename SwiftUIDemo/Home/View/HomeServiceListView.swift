//
//  HomeSnapshotView.swift
//  SwiftUIDemo
//
//  Created by Zhangxu on 2020/12/21.
//

import SwiftUI

struct HomeServiceListView: View {
    
    ///
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
                    
        VStack(alignment: .leading, spacing: 10, content: {
            
            Text("医疗卫生").font(.system(size: 14))
                .offset(x: 2)
                
            ScrollView.init(.horizontal, showsIndicators: false, content: {
                
                HStack(alignment:.center,spacing: 5){
                    
                    /// 循环遍历生成服务列表View
                    ForEach(0..<homeViewModel.serviceListCount()){
                    
                       BaseServiceView(serviceName: homeViewModel.serviceListName($0),serviceImage: homeViewModel.serviceListImage($0))
                   }
                }
            })
        })
    }
}

struct HomeServiceListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeServiceListView().environmentObject(HomeViewModel())
    }
}
