//
//  MineView.swift
//  RxSwiftObj
//
//  Created by Zhangxu on 2020/11/30.
//

/// https://zhuanlan.zhihu.com/p/111010271
/// https://zhuanlan.zhihu.com/p/111151515
/// https://zhuanlan.zhihu.com/p/68275232

import SwiftUI

struct MineView: View {
    
    /// 导航标题
    var title:String
    /// 是否跳转登录
    @State private var isPresented = false
    
    @EnvironmentObject var action:NavigationAction
    
    /// @State var list:[Int] = []
    
    //如果整个项目的List都需要设背景的话，可以把init里面的代码移到AppDelegate.swift的didFinishLaunchingWithOptions启动函数里
    /*若非要设置整个List的背景色 就先按照下面方式设置在设置List
     background(
        /// edgesIgnoringSafeArea安全区域管理
        Color.orange.edgesIgnoringSafeArea(.all)
     )
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        //若不要row分隔线的话：
        //UITableView.appearance().separatorStyle = .none
    } */
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                
                VStack{

                    MineHeaderView(image: Image("yukon_charleyrivers"))
                        .frame(width: 300, height: 100, alignment: .center)
                        .offset(x: 0, y: 0)

                    /// 登录/昵称按钮
                    Button.init(action: {

                        /// toggle函数的解释 切换
                        /// Use this method to toggle a Boolean value from `true` to `false` or from`false` to `true`.
                        self.isPresented.toggle()
                    }, label: {

                        Text("登录")
                            .font(.title2)
                            .accentColor(.black)
                    }).offset(x: 0, y: 40)
                      .sheet(isPresented: $isPresented, content: {

                        BaseLoginView(isPresented: $isPresented, userName: "", passWord: "")
                    })

                    /// 强调的ListView
                    MineAccentListView()
                        .frame(width: 300, height: 40, alignment: .center)
                        .offset(x: 0, y: 50)
                
                }.frame(width: 300, height: 250, alignment: .center)

                /// List
                List{
                    
                    ForEach(mineListData){ listData in

                        NavigationLink.init(destination: MineListDetailView(mineModel:listData).environmentObject(self.action),
                            label:{
                                
                            MineListRowView(liseModel: listData)
                        })
                    }
                }.offset(x: 0, y: 20)
                /// 可以观察下不设置这个属性的时候List是什么样子
                /// 要是加载在 HStack里面，在默认模式下上下左右会有间距
                .listStyle(PlainListStyle())
                .navigationTitle(title)
                /*
                .onAppear{
                    _ = (0...30).map{ _ in
                        self.list.append(Int.random(in: 0...50))
                    }
                }*/
            }
        }
    }
}

struct MineView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MineView(title: "我的").environmentObject(NavigationAction())
    }
}
