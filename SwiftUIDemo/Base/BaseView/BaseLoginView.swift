//
//  BaseLoginView.swift
//  RxSwiftObj
//
//  Created by Zhangxu on 2020/11/30.
//

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
    @State private var userPhone:String = ""
    @State private var passWord:String  = ""
    
    ///
    var body: some View {
        
        Background {
            
            VStack{
                
                VStack(alignment: .leading, spacing: 20, content: {
            
                    /// username
                    Text(isAvailablePhoneNumber ? "phone number available" : "please enter the phone number")
                        .bold()
                        .foregroundColor(isAvailablePhoneNumber ? Color(.color_3) : Color(.main))
                        
                    /// 这个"phone number"是提示语
                    TextField("phone number", text: $userPhone) { (value) in
                        
                        if self.userPhone.count == 11 {
                            
                            isAvailablePhoneNumber = true
                        }else{
                            
                            isAvailablePhoneNumber = false
                        }
                        print("onEditingChangedUserPhone:\(self.userPhone)")
                    } onCommit: {
                        
                        print("onCommitUserPhone:\(self.userPhone)")
                    }
                    
                    /// textFiled的 style
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    ///.border(Color(.main), width: 1)
                    
                    /// password
                    Text("please enter the password")
                        .bold()
                        .foregroundColor(Color(.main))
                    TextField("password", text: $passWord) { (value) in
                        
                        print("onEditingChangedUserPassWord:\(self.passWord)")
                    } onCommit: {
                        
                        print("onCommitUserPassWord:\(self.passWord)")
                    }
                    
                    /// textFiled的 style
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.asciiCapable)
                    ///.border(Color(.main), width: 1)
                    
                }).frame(width: 340, height: 200, alignment: .center)
                  .offset(x: 0, y: -100)
                  
                /// 登录
                Button(action: {
                    
                    self.endEditing()
                }, label: {
                    
                    Text("立即登录").font(.system(size: 16)).accentColor(.white)
                }).frame(width: 200, height: 40)
                  .background(Color(.main))
                  .cornerRadius(20)
                  .offset(y: -30)
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

