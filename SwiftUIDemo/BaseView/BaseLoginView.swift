//
//  BaseLoginView.swift
//  RxSwiftObj
//
//  Created by Zhangxu on 2020/11/30.
//

/// 在这个页面利用RxSwift处理一下登录的逻辑Rx的开始

import SwiftUI

struct Background<Content: View>: View {
    
    private var content: Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }

    var body: some View {
         
        Color.white
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .overlay(content)
    }
}


struct BaseLoginView: View {
    
    @Binding var isPresented:Bool
    
    @State private var isAvailablePhoneNumber = false
    
    @State var userName:String
    @State var passWord:String
    
    ///
    var body: some View {
        
        Background {
            
            VStack{
                
                VStack(alignment: .leading, spacing: 20, content: {
            
                    /// username
                    Text(isAvailablePhoneNumber ? "phone number available" : "please enter the phone number").bold()
                
                    /// 这个"phone number"是提示语
                    TextField("phone number", text: $userName) { (value) in
                        
                        if self.userName.count > 11{
                            isAvailablePhoneNumber = true
                        }else{
                            isAvailablePhoneNumber = false
                        }
                        print("onEditingChanged:\(self.userName)")
                    } onCommit: {
                        
                        print("onCommit:\(self.userName)")
                    }
                    
                    
                    /// textFiled的 style
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    ///.keyboardType(.default)
                    .border(Color.blue, width: 1)
                
                    Spacer()
                    
                    /// password
                    Text("please enter the password").bold()
                    TextField.init("password", text: $passWord) { (value) in
                        
                    } onCommit: {
                        
                    }
                    /// textFiled的 style
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .border(Color.blue, width: 1)
            
                }).frame(width: 340, height: 200, alignment: .center)
                  .offset(x: 0, y: -100)

                /// 登录
                Button.init(action: {
                    
                    self.endEditing()
                    
                }, label: {
                    
                    Text("登录")
                        .font(.system(size: 20))
                        .accentColor(.blue)
                })
            }
        }.onTapGesture {
            
            self.endEditing()
        }
    }
    
    /// 点击结束编辑模式、回收键盘
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
}

