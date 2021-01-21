//
//  HomeBannerDetailView.swift
//  SwiftUIDemo
//
//  Created by Zhangxu on 2021/1/12.
//

import SwiftUI

struct HomeBannerDetailView: View {
    
    @State var textState:Bool
    
    var body: some View {
        
        VStack{
            
            Toggle(isOn: $textState) {
                Text("控制开关")
                    .foregroundColor(.orange)
            }.frame(width: 140, height: 50)
            
            Text(textState == false ? "控制开关已关闭" : "控制开关已打开")
                .foregroundColor(textState == false ? .red : .green)
        }
    
    }
}

struct HomeBannerDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        HomeBannerDetailView(textState:false)
    }
}
