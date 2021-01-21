//
//  AroundViewModel.swift
//  SwiftUIDemo
//
//  Created by Zhangxu on 2020/12/23.
//

/*在一起漫天大雪的夜晚，寒风刺骨，有一只兔子，在刨自己喜欢吃的胡萝卜，刨了好久可就是刨不出来那根被冻在土里的胡萝卜，这时候菜园子的主人来了，他抱起那只已经被冻的不知道跑了的兔子，他摸着兔子的头说，这么冷的天，就你和我一样，他抱着这只兔子来到火炉旁，给兔子最喜欢吃的胡萝卜，这时候兔子突然开口说话幻化成人形，你救了我我可以帮你实现一个愿望，主人说不用了，我没啥愿望，从那时候开始，主人外出它就变成兔子跟着他，主人回家他就幻化成人形，日子一天一天的过了，慢慢的他们熟悉了彼此，他们相爱了，约定了终身。
 
    又是一个更加寒冷的冬季，菜园子主人外出遇到一群豺狼，它们向这个男人嘶吼着冲过来，*/

import SwiftUI
import CoreLocation

/// 要定义在里面每次都会被重置
var aroundLocationIndex = 0

class AroundViewModel:ObservableObject {

    static let `shared` = AroundViewModel()
    
    /// 创建一个可以观察的对象
    @Published var userLocationCoordinate:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0.0000000, longitude: 0.000000)
    /// 
    @Published var userLocationArray:Array<UserLocation> = Array()
    
    init() {
        
        /// 开始定位
        userLocation { (plackMark) in
            
            /// mkmapView监听了这个属性的，这里改变之后是会刷新地图内容的
            /// 在AroundMapView里面我们以这个点为地图中心点
            self.userLocationCoordinate = plackMark.location!.coordinate
            
            print("aroundLocationIndex-1：",aroundLocationIndex)
            let locationModel = UserLocation(id: aroundLocationIndex,
                latitude: plackMark.location?.coordinate.latitude ?? 0.000000,
               longitude: plackMark.location?.coordinate.longitude ?? 0.000000,
                location: plackMark.thoroughfare ?? "获取位置出错啦~")
            self.userLocationArray.append(locationModel)
            print("aroundLocationIndex-1：",self.userLocationArray)
            /// 加1
            aroundLocationIndex += 1
        }
    }
}

// MARK: -
extension AroundViewModel {
    
    ///定位获取位置
    func userLocation(_ locationSuccess: @escaping LocationSuccess) {
        
        ///
        BaseLocationViewModel.shared.userLocation { (placeMark) in
            
            locationSuccess(placeMark)
        } locationFail: { (errorMsg) in
          
            print("获取定位ErrorMSg：" + errorMsg)
        }
    }
    
    /// 添加一个新的位置
    /// - Parameter location: location description
    func addLocationWithTap(_ location:CLLocationCoordinate2D) {
        
        /// 当我们添加一个新位置的时候，把地图的中心点重置到点击的位置
        self.userLocationCoordinate = location
        
        print("aroundLocationIndex-2：",aroundLocationIndex)
        BaseLocationViewModel.shared.reverseGeocodeUserLocation(location) { (placeMark) in
            
            let locationModel = UserLocation(id:aroundLocationIndex,
                                 latitude: location.latitude,
                                longitude: location.longitude,
                                 location: placeMark.thoroughfare ?? "反地理编译未获取到你点击位置的具体地址")
            /// 一定要记得加1
            aroundLocationIndex += 1
            self.userLocationArray.append(locationModel)
            print("aroundLocationIndex-2：",self.userLocationArray)
        }
    }
}
