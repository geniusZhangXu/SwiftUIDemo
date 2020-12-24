//
//  HomeButtonView.swift
//  SwiftUIDemo
//
//  Created by Zhangxu on 2020/12/21.
//

import SwiftUI

struct HomeButtonView: View {
    
    let spacing = (kScreenWidth - 30 - 4*83)/4
    
    var body: some View {
        
        HStack(alignment: .center, spacing: spacing){
            
            ///这个button的size在不设置的情况下是由Image的size决定的
            Button(action: {

                
            }, label: {
                /// 这里文字需要在图片上面，所以我们使用ZStack
                ZStack(alignment:.leading) {
                    
                    VStack(alignment:.leading){
                        
                        Text("智慧西安").font(.system(size: 12))
                            .offset(x: 5, y: -5)
                        Text("打造智慧城市").font(.system(size: 10))
                            .offset(x: 5, y: 5)
                    }.foregroundColor(Color(.color_37))
                    Image(String.Image.icon_homeService_1)
                }
            })
            
            Button(action: {
                
            }, label: {
                
                ZStack(alignment:.leading) {
                    
                    VStack(alignment:.leading){
                        
                        Text("智慧广州").font(.system(size: 12))
                            .offset(x: 5, y: -5)
                        Text("打造智慧广州").font(.system(size:10))
                            .offset(x: 5, y: 5)
                    }.foregroundColor(Color(.color_EF9))
                    Image(String.Image.icon_homeService_2)
                }
            })
            
            Button(action: {
                
            }, label: {
                
                ZStack(alignment:.leading) {
                    
                    VStack(alignment:.leading){
                        
                        Text("关爱老人").font(.system(size: 12))
                            .offset(x: 5, y: -5)
                        Text("关爱孤寡老人").font(.system(size: 10))
                            .offset(x: 5, y: 5)
                    }.foregroundColor(Color(.color_42))
                    Image(String.Image.icon_homeService_3)
                }
            })
            
            Button(action: {
                
            }, label: {
                
                ZStack(alignment:.leading) {
                    
                    VStack(alignment:.leading){
                        
                        Text("爱心助教").font(.system(size: 12))
                            .offset(x: 5, y: -5)
                        Text("关爱留守儿童").font(.system(size: 10))
                            .offset(x: 5, y: 5)
                    }.foregroundColor(Color(.color_80))
                    Image(String.Image.icon_homeService_4)
                }
            })
        }
    }
}

struct HomeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        HomeButtonView()
    }
}
