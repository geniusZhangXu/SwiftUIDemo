//
//  ServiceMapView.swift
//  SwiftUIDemo
//
//  Created by Zhangxu on 2020/12/23.
//

import SwiftUI
import MapKit

struct AroundMapView: UIViewRepresentable {
        
    /// 点击回调
    var tappedCallback: ((CLLocationCoordinate2D) -> Void)
    
    /// 传入一个需要的位置,以这个位置为重点
    @Binding var centerCoordinate:CLLocationCoordinate2D
    
    @Binding var locationArray:Array<UserLocation>
    
    ///原本想尝试看能不能在updateUIView接收这个返回的View在其他地方使用，但还是我们既然把AroundMapView写成了结构体，那就意味着要在方法里修改变量值就得加mutating修饰，但修饰了这个方法之后就会有没有遵守协议方法的问题，可以把结构体改成类试试
    /// var mkMapView:MKMapView? = nil
    
    /// 返回你想转换的视图
    /// - Parameter context: context description
    /// - Returns: description
    func makeUIView(context: Context) -> MKMapView {
        
        MKMapView(frame: .zero)
    }
    
    /// Description
    /// - Parameters:
    ///   - uiView: uiView description
    ///   - context: context description
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: centerCoordinate, span: span)
        uiView.setRegion(region, animated: true)
    
        /// 添加大头针
        addAnimation(uiView, locationArray)
        addTapGestureRecognizer(uiView,context)
    }
    
    /// 添加大头针
    /// - Parameters:
    ///   - uiView: uiView description
    ///   - locationArray: locationArray description
    func addAnimation(_ uiView: MKMapView,_ locationArray:Array<UserLocation>)  {
        
        locationArray.forEach { (userLocation) in
            
            let pointAnimation = MKPointAnnotation()
            pointAnimation.coordinate.latitude = userLocation.latitude
            pointAnimation.coordinate.longitude = userLocation.longitude
            pointAnimation.title = ""
            uiView.addAnnotation(pointAnimation)
        }
    }
    
    /// 给地图添加单击手势
    /// - Parameters:
    ///   - uiView: uiView description
    ///   - context: context description
    func addTapGestureRecognizer(_ uiView: MKMapView,_ context: Context) {
        
        let tapGestureRecognizer = UITapGestureRecognizer.init(target: context.coordinator, action: #selector(Coordinator.tapGestureRecognizerMapView(gesture:)))
        uiView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    /// Coordinator
    class Coordinator: NSObject {
        
        /// 点击回调
        var tappedCallback: ((CLLocationCoordinate2D) -> Void)
        
        /// 初始化方法
        /// - Parameter tappedCallback: tappedCallback description
        init(tappedCallback: @escaping ((CLLocationCoordinate2D) -> Void)) {
            
            self.tappedCallback = tappedCallback
        }
        
        /// 点击事件
        /// - Parameter gesture: gesture description
        @objc func tapGestureRecognizerMapView(gesture:UITapGestureRecognizer) {
            
            let point = gesture.location(in: gesture.view)
            /// 转换点击的View 用于根据点击的位置获取经纬度
            guard let pointView = gesture.view as? MKMapView else { return }
            /// 使用下面的方法获取经纬度信息
            /// open func convert(_ point: CGPoint, toCoordinateFrom view: UIView?) -> CLLocationCoordinate2D
            let touchMapPoint = pointView.convert(point, toCoordinateFrom: pointView)
            ///
            self.tappedCallback(touchMapPoint)
        }
    }
    
    ///
    /// - Returns: description
    func makeCoordinator() -> Coordinator {
        
        return Coordinator(tappedCallback:self.tappedCallback)
    }
}


class AroundMapViewDelegate:NSObject,MKMapViewDelegate{
    
    ///
    /// - Parameters:
    ///   - mapView: mapView description
    ///   - annotation: annotation description
    /// - Returns: description
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let annotationView = MKAnnotationView()
        return annotationView
    }
}
