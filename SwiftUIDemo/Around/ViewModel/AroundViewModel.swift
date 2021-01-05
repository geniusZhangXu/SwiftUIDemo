//
//  AroundViewModel.swift
//  SwiftUIDemo
//
//  Created by Zhangxu on 2020/12/23.
//

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
