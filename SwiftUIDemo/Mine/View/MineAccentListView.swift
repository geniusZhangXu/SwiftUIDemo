//
//  MineAccentListView.swift
//  RxSwiftObj
//
//  Created by Zhangxu on 2020/12/2.
//

import SwiftUI

struct MineAccentListView: View {
    
    var body: some View {
        
        GeometryReader.init(content: { geometry in
            
            HStack{
            
                Button.init(action: {
                    
                    
                }, label: {
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("签到")
                        .accentColor(.black)
                })
                
                Spacer()
                /// 区分下下面的Divider
                /// /// A visual element that can be used to separate other content.
                ///
                /// When contained in a stack, the divider extends across the minor axis of the
                /// stack, or horizontally when not in a stack.
                /// Divider() 分隔物
                Button.init(action: {
                    
                }, label: {
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.purple)
                    Text("收藏")
                        .accentColor(.black)
                })
                
                Spacer()
                
                Button.init(action: {
                    
                }, label: {
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.green)
                    Text("消息")
                        .accentColor(.black)
                })
            }
        })
    }
}

struct MineAccentListView_Previews: PreviewProvider {
    static var previews: some View {
        MineAccentListView()
    }
}
