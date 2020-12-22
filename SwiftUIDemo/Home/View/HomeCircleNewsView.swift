//
//  HomeCircleNewsView.swift
//  SwiftUIDemo
//
//  Created by Zhangxu on 2020/12/21.
//

import SwiftUI

struct HomeCircleNewsView: View {
    
    let colors:[Color] = [.green,.blue,.orange,.pink,.purple]
    
    var body: some View {
        
        GeometryReader.init(content: { geometry in
          
            HStack{
                
                let width = kScreenWidth - 40
                ForEach.init(colors, id: \.self) {
                    
                    $0.frame(width: width)
                }
            }.frame(width: geometry.size.width,
                   height: geometry.size.height,
                alignment: .leading)
            
        }).frame(height: 200)
    }
}



struct HomeCircleNewsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeCircleNewsView()
    }
}
