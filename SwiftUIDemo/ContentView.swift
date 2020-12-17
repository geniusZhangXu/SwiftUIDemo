//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Zhangxu on 2020/12/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
        /// List
        List{
            
            ForEach(mineListData){ listData in

                MineListRowView(liseModel: listData)
            }
        }.offset(x: 0, y: 0)
        /// 可以观察下不设置这个属性的时候List是什么样子
        /// 要是加载在 HStack里面，在默认模式下上下左右会有间距
        .listStyle(PlainListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
