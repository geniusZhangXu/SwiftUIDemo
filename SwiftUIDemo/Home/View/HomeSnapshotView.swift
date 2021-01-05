//
//  HomeServiceListView.swift
//  SwiftUIDemo
//
//  Created by Zhangxu on 2020/12/21.
//

import SwiftUI

struct HomeSnapshotView: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel

    var body: some View {
       
        VStack(alignment: .leading, content: {
            
            Text("最美风景").font(.system(size: 14))
            
            ScrollView(.horizontal, showsIndicators:false, content:{
                
                HStack(alignment: .center,spacing: 15, content:{
                    
                    ForEach(0..<homeViewModel.snapshotCount()){ index in
                        
                        VStack{
                            
                            Image(homeViewModel.snapshotImage(index))
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .clipped() /// 裁减
                                .cornerRadius(10)
                            Text(homeViewModel.snapshotName(index)).font(.system(size: 12))
                        }
                    }
                })
            }).frame(width: kScreenWidth - 30, height: 105, alignment: .center)
        })
    }
}

struct HomeSnapshotView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        HomeSnapshotView().environmentObject(HomeViewModel())
    }
}
