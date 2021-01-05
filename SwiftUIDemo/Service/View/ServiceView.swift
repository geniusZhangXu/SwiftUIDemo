//
//  ServiceView.swift
//  SwiftUIObj
//
//  Created by Zhangxu on 2020/11/30.
//


import SwiftUI

struct ServiceView: View {
    
    /// 标题
    var title:String

    ///
    private let serviceViewModel = ServiceViewModel()
    
    var body: some View {
        
        NavigationView {
            
            ScrollView(content: {
                
                HStack(alignment: .top , spacing: 10) {
                   
                    List(serviceViewModel.serviceModelArray, id: \.self) { model in
                       
                       Text(model.sectionTitle)
                           .font(.system(size: 14))
                           .foregroundColor(Color(.color_3))
                    }.frame(width: serviceViewModel.sectionListWidth, height: kScreenHeight)
                     .listStyle(PlainListStyle())
                   
                    VStack(alignment: .leading){
                        
                        ForEach(serviceViewModel.serviceModelArray , id:\.self ) { model in
                            
                            ServiceSectionView(serviceModel: model)
                        }
                    }
               }
            }).navigationTitle(title)
            
        }
    }
}

struct ServiceView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ServiceView(title: "服务")
    }
}
