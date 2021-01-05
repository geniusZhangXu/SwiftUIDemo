//
//  ServiceSectionView.swift
//  SwiftUIDemo
//
//  Created by Zhangxu on 2021/1/4.
//

import SwiftUI

struct ServiceSectionView: View {
    
    @State var serviceModel:ServiceModel
    
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 10){
            
            Text(serviceModel.sectionTitle)
                .font(.subheadline)
                .foregroundColor(Color(.color_3))
            
            /// 服务列表
            ServiceSectionItemView(serviceModel: serviceModel)
            
        }.frame(width: ServiceViewModel().sectionScrollWidth,
               height: ServiceViewModel().sectionScrollHeight(serviceModel.id))
    }
}

struct ServiceSectionView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ServiceSectionView(serviceModel: ServiceViewModel().serviceModelArray.first!)
    }
}
