//
//  ServiceSectionItemView.swift
//  SwiftUIDemo
//
//  Created by Zhangxu on 2021/1/4.
//

import SwiftUI

struct ServiceSectionItemView: View {
    
    @State var serviceModel:ServiceModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            ForEach(serviceModel.serviceArray, id:\.self) { (modelArray) in
                
                HStack {
                    
                    ForEach(modelArray) { (model) in
                        
                      BaseServiceView(serviceName:model.serviceName,
                                     serviceImage:model.serviceName)
                    }
                }
            }
        }
        
    }
}

struct ServiceSectionItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ServiceSectionItemView(serviceModel:
            ServiceViewModel().serviceModelArray.first!)
    }
}
