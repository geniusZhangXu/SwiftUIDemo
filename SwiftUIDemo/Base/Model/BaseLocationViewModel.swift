//
//  BaseLocationViewModel.swift
//  SwiftUIDemo
//
//  Created by Zhangxu on 2020/12/23.
//

import Foundation
import CoreLocation

/// 定位成功获取到的经纬度和具体信息
typealias LocationSuccess = (_ locationPlacemark:CLPlacemark) -> Void
typealias LocationFail = (_ errorMsg:String) -> Void
 
class BaseLocationViewModel:NSObject {
    
    static let `shared` = BaseLocationViewModel()
    
    /// 成功和失败回调
    var locationSuccess:LocationSuccess?
    var locationFail:LocationFail?
    
    /// manager
    lazy var locationManager: CLLocationManager = {
        
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        /// 导航级别
        /*
         kCLLocationAccuracyBestForNavigation  /// 适合导航
         kCLLocationAccuracyBest               /// 这个是比较推荐的综合来讲，我记得百度也是推荐
         kCLLocationAccuracyNearestTenMeters   /// 10m
         kCLLocationAccuracyHundredMeters      /// 100m
         kCLLocationAccuracyKilometer          /// 1000m
         kCLLocationAccuracyThreeKilometers    /// 3000m
         */
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        /// 隔多少米定位一次
        locationManager.distanceFilter = 10
        return locationManager
    }()
    
    /// CLGeocoder 地理编码器
    lazy var locationGeocoder: CLGeocoder = {
        
        let locationGeocoder = CLGeocoder()
        return locationGeocoder
    }()
}

// MARK: - location
extension BaseLocationViewModel:CLLocationManagerDelegate {
    
    /// 刚开始使用 struct 使用 mutating 关键字修饰方法是为了能在该方法中修改 struct 或是 enum 的变量
    
    /// 获取用户位置
    /// - Parameters:
    ///   - locationSuccess: 获取位置成功返回的经纬度
    ///   - locationFail:    获取位置失败
    func userLocation(locationSuccess: @escaping LocationSuccess,
                         locationFail: @escaping LocationFail) {
        
        self.locationSuccess = locationSuccess
        self.locationFail = locationFail
        
        /// 先判断用户定位是否可用 默认是不启动定位的
        if CLLocationManager.locationServicesEnabled() {
            
            /// userLocationManager.startUpdatingLocation()
            /// 单次获取用户位置
            locationManager.requestLocation()
        }else{
            
            /// plist添加 NSLocationWhenInUseUsageDescription NSLocationAlwaysUsageDescription
            /// 提个小的知识点，以前我们写这个内容的时候都比较随意，但现在按照苹果的审核要求
            /// 你必须得明确说明他们的使用意图，不然会影响审核的，不能随便写个需要访问您的位置
            /// 请求使用位置 前后台都获取
            locationManager.requestAlwaysAuthorization()
            /// 请求使用位置 前台都获取
            /// userLocationManager.requestWhenInUseAuthorization()
        }
    }
    
    /// 用户授权回调
    /// - Parameter manager: manager description
    /// open > public > interal > fileprivate > private
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        /// CLAuthorizationStatus
        switch manager.authorizationStatus {
        
            case .notDetermined:
                print("用户没有决定")
            case .authorizedWhenInUse:
                print("使用App时候允许")
            case .authorizedAlways:
                print("用户始终允许")
            case.denied:
                print("定位关闭或者对此APP授权为never")
                /// 这种情况下你可以判断是定位关闭还是拒绝
                /// 根据locationServicesEnabled方法
            case .restricted:
                print("访问受限")
            @unknown default:
                print("不确定的类型")
        }
    }
    
    /// 下面方法已弃用 使用上面的
    /// - Parameters:
    ///   - manager: manager description
    ///   - status: status description
    /*
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    }*/
    
    /// 获取更新到的用户位置
    /// - Parameters:
    ///   - manager: manager description
    ///   - locations: locations description
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print("纬度：" + String(locations.first?.coordinate.latitude ?? 0))
        print("经度：" + String(locations.first?.coordinate.longitude ?? 0))
        print("海拔：" + String(locations.first?.altitude ?? 0))
        print("航向：" + String(locations.first?.course ?? 0))
        print("速度：" + String(locations.first?.speed ?? 0))
        
        /*
         纬度34.227653802098665
         经度108.88102549186357
         海拔410.17602920532227
         航向-1.0
         速度-1.0
         */
        /// 反编码得到具体的位置信息
        guard let coordinate = locations.first else { return  }
        reverseGeocodeLocation(location: coordinate )
    }
    
    /// 获取失败回调
    /// - Parameters:
    ///   - manager: manager description
    ///   - error: error description
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        print("定位Error：" + error.localizedDescription)
        guard let locationFail = self.locationFail else{return}
        locationFail(error.localizedDescription)
    }
}

// MARK: - geocoder
extension BaseLocationViewModel{
    
    /// 地理编码
    /// - Parameter addressString: addressString description
    private func geocodeUserAddress(addressString:String) {
        
        locationGeocoder.geocodeAddressString(addressString){(placeMark, error) in
            
            print("地理编码纬度:",placeMark?.first?.location?.coordinate.latitude ?? "")
            print("地理编码经度:",placeMark?.first?.location?.coordinate.longitude ?? "")
        }
    }
    
    /// 反地理编码定位得到的位置信息
    /// - Parameter location: location description
    private func reverseGeocodeLocation(location:CLLocation){
        
        locationGeocoder.reverseGeocodeLocation(location){(placemark, error) in
            
            /// city, eg. Cupertino
            print("反地理编码-locality：" + (placemark?.first?.locality ?? ""))
            /// eg. Lake Tahoe
            print("反地理编码-inlandWater：" + (placemark?.first?.inlandWater ?? ""))
            /// neighborhood, common name, eg. Mission District
            print("反地理编码-subLocality：" + (placemark?.first?.subLocality ?? ""))
            /// eg. CA
            print("反地理编码-administrativeArea：" + (placemark?.first?.administrativeArea ?? ""))
            /// eg. Santa Clara
            print("反地理编码-subAdministrativeArea：" + (placemark?.first?.subAdministrativeArea ?? ""))
            /// eg. Pacific Ocean
            print("反地理编码-ocean：" + (placemark?.first?.ocean ?? ""))
            /// eg. Golden Gate Park
            print("反地理编码-areasOfInterest：",(placemark?.first?.areasOfInterest ?? [""]))
            /// 具体街道信息
            print("反地理编码-thoroughfare：",(placemark?.first?.thoroughfare ?? ""))
            
            /// 回调得到的位置信息
            guard let locationPlacemark = placemark?.first else{return}
            guard let locationSuccess = self.locationSuccess else{return}
            locationSuccess(locationPlacemark)
            /// 地理编码位置，看能不能得到正确经纬度
            self.geocodeUserAddress(addressString: (placemark?.first?.thoroughfare ?? ""))
        }
    }
    
    
    /// 公开的反地理编译一个经纬度
    /// - Parameters:
    ///   - location: location description
    ///   - locationSuccess: locationSuccess description
    open func reverseGeocodeUserLocation(_ location:CLLocationCoordinate2D,
                                    _ locationSuccess:@escaping LocationSuccess){
        
        let clLocation = CLLocation(latitude: location.latitude, longitude: location.longitude)
        self.locationSuccess = locationSuccess
        self.reverseGeocodeLocation(location: clLocation)
    }
}
