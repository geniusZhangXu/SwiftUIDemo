//
//  BaseServiceView.swift
//  SwiftUIDemo
//
//  Created by Zhangxu on 2020/12/21.
//

import SwiftUI

struct BaseServiceView: View {
    
    var serviceName:String
    var serviceImage:String
    
    var body: some View {
        
        VStack{
            
            Image(serviceName).scaleEffect(0.4)
            Text(serviceImage).font(.system(size: 12))
                .offset(x: 0, y: -30)
            /// 只有英文效果起作用
            /// Text("Hello, world!").italic()
        }.frame(width: 60, height: 85, alignment: .center)
    }
}

struct BaseServiceView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        BaseServiceView(serviceName:"预约挂号",serviceImage:"预约挂号")
    }
}
