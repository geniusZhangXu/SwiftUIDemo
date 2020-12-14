//
//  BaseTabbarView.swift
//  RxSwiftObj
//
//  Created by Zhangxu on 2020/11/30.
//

import SwiftUI

struct BaseTabbarView: View {
    
    /// 理解State这个属性 https://www.cnblogs.com/xiaoniuzai/p/11417123.html
    /*
     通过使用 @State 修饰器我们可以关联出 View 的状态. SwiftUI 将会把使用过 @State 修饰器的属性存储到一个特殊的内存区域，并且这个区域和 View struct 是隔离的. 当 @State 装饰过的属性发生了变化，SwiftUI 会根据新的属性值重新创建视图
     */
    @State private var selectedTab = 0
    
    var body: some View {
        
        /// public init(selection: Binding<SelectionValue>?, @ViewBuilder content: () -> Content)
        TabView(selection: $selectedTab){
            
            HomeView(title: "首页")
                .tabItem {
                    Image(selectedTab == 0 ? "icon_home_selected" : "icon_home")
                    Text("首页")
                }
                .onTapGesture {
                    selectedTab = 0
                }
                .tag(0)
            
            ServiceView(title: "周边")
                .tabItem {
                    Image(selectedTab == 1 ? "icon_around_selected" : "icon_around")
                    Text("周边")
                }
                .onTapGesture {
                    selectedTab = 1
                }
                .tag(1)
            
            AroundView(title: "服务")
                .tabItem {
                    Image(selectedTab == 2 ? "icon_service_selected" : "icon_service")
                    Text("服务")
                }
                .onTapGesture {
                    selectedTab = 2
                }
                .tag(2)
            
            MineView(title: "我的").environmentObject(NavigationAction())
                .tabItem {
                    Image(selectedTab == 3 ? "icon_mine_selected" : "icon_mine")
                    Text("我的")
                }
                .onTapGesture {
                    selectedTab = 3
                }
                .tag(3)
        /// 这个着重颜色设置可以设置tabbaritem字体的颜色
        }.accentColor(.blue)
    }
}

struct BaseTabbarView_Previews: PreviewProvider {
    /// 预览视图，你试着在这里多添加两个看看效果呀
    static var previews: some View {
        
        BaseTabbarView()
    }
}
