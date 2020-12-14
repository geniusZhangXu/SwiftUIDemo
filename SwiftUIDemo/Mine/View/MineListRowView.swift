//
//  MineListView.swift
//  RxSwiftObj
//
//  Created by Zhangxu on 2020/12/2.
//

import SwiftUI

struct MineListRowView: View {
    
    var liseModel: MineLiseModel
    
    var body: some View {
        
        HStack{
            
            Image(liseModel.imageName)
                .foregroundColor(.yellow)
            
            Text(liseModel.listName)
                .accentColor(.black)
        }
    }
}


struct MineListView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MineListRowView(liseModel: mineListData[0])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
