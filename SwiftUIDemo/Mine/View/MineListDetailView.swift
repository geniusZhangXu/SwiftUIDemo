//
//  MineListDetailView.swift
//  RxSwiftObj
//
//  Created by Zhangxu on 2020/12/2.
//

import SwiftUI

struct MineListDetailView: View {
    
    @EnvironmentObject var action: NavigationAction
    
    var mineModel:MineLiseModel
    ///
    var body: some View {
        
        VStack{
            
            Text(action.mineLiseModels.first?.listName ?? "")
        }
            
    }
}

/// 
struct MineListDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        return MineListDetailView(mineModel: mineListData[0]).environmentObject(NavigationAction())
    }
}
