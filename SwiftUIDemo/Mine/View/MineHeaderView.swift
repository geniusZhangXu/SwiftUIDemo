//
//  MineHeaderView.swift
//  RxSwiftObj
//
//  Created by Zhangxu on 2020/12/2.
//

import SwiftUI

struct MineHeaderView: View {
    
    var image: Image
    
    var body: some View {
        
        image.clipShape(Circle())
             .overlay(Circle().stroke(Color.white,lineWidth: 4))
             .shadow(radius: 10)
             .scaleEffect(0.3)
    }
}


struct MineHeaderView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MineHeaderView(image: Image("yukon_charleyrivers"))
    }
}
