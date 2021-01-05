//
//  AroundView.swift
//  RxSwiftObj
//
//  Created by Zhangxu on 2020/11/30.
//

/// 对 UIViewRepresentable 协议的理解学习
/// 通过该协议就可以让我们再SwiftUI中使用UIKit的东西
/// 实现该协议的两个方法makeUIView和updateUIView

import SwiftUI
import CoreLocation

struct AroundView: View {
    
    /// 标题
    var title:String
    ///
    @EnvironmentObject var aroundViewModel:AroundViewModel
    
    var body: some View {
        
        NavigationView{
            
            GeometryReader(content: { geometry in
                
                VStack{
                    /// 地图
                    AroundMapView(tappedCallback:{ tapPoint in
                        
                        /// 在数组添加数据
                        aroundViewModel.addLocationWithTap(tapPoint)
                    },centerCoordinate: $aroundViewModel.userLocationCoordinate,
                         locationArray: $aroundViewModel.userLocationArray)
                         .frame(height: 300)
                        
                    /// 地址List
                    List(aroundViewModel.userLocationArray, id: \.self){ model in
                                                    
                        VStack(alignment: .leading, spacing: 5){
                            
                            Text(model.location)
                                .font(.system(size: 14))
                                .foregroundColor(Color(.color_3))
                            Text("经度：" + String(model.latitude))
                                .font(.system(size: 12))
                                .foregroundColor(Color(.color_9))
                            Text("纬度：" + String(model.longitude))
                                .font(.system(size: 12))
                                .foregroundColor(Color(.color_9))
                        }
                    }.listStyle(PlainListStyle())
                }.navigationTitle(title)
            })
        }
    }
}


struct AroundView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        AroundView(title: "周边").environmentObject(AroundViewModel())
    }
}
