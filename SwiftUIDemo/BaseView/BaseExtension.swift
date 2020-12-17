//
//  BaseExtension.swift
//  RxSwiftObj
//
//  Created by Zhangxu on 2020/12/13.
//

import SwiftUI

extension UIApplication {
    
    func endEditing() {
        
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
