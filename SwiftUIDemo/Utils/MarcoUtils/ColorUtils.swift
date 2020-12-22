//
//  ColorUtils.swift
//  WisdomFN
//
//  Created by Zhangxu on 2020/7/16.
//  Copyright © 2020 Zhangxu. All rights reserved.
//

import UIKit

// MARK: - used colors 
extension UIColor {
    
    /// 主题色
    class var main : UIColor {
        return UIColor(hexString: "5673FF")
    }
    
    /// 半透明主题色
    class var translucenceMain : UIColor {
        return UIColor(hexString: "5673FF",alpha: 0.5)
    }
    
    /// 辅助背景色
    class var assistBackgroundColor: UIColor {
        return UIColor(hexString: "F6F8FA")
    }
    
    /// 背景色
    class var backgroundColor: UIColor {
        return UIColor(hexString: "F1F1F1")
    }
    
    /// 分割线颜色
    class var separatorColor: UIColor {
        return UIColor(hexString: "EEEEE1")
    }
    
    /// 半透明黑
    class var translucenceBlackColor: UIColor {
        return UIColor(hexString: "000000",alpha:0.2)
    }
    
    /// 半透明白
    class var translucenceWhiteColor: UIColor {
        return UIColor(hexString: "FFFFFF",alpha:0.5)
    }
    
    /// HEX 999999
    class var color_9: UIColor {
        return UIColor(hexString: "999999")
    }
    
    /// HEX 333333
    class var color_3: UIColor {
        return UIColor(hexString: "333333")
    }
    
    /// HEX 666666
    class var color_6: UIColor {
        return UIColor(hexString: "666666")
    }
    
    /// HEX CCCCCC
    class var color_C: UIColor {
        return UIColor(hexString: "CC0000")
    }

    /// HEX EE6B2E 接近橘色
    class var color_EE: UIColor {
        return UIColor(hexString: "EE6B2E")
    }
    
    /// HEX FF0000 红色 FF0000
    class var color_F0: UIColor {
        return UIColor(hexString: "FF0000")
    }
    
    /// HEX FF8D02
    class var color_FF: UIColor {
        return UIColor(hexString: "FF8D02")
    }
    
    ///HEX 418CE0
    class var color_41: UIColor {
        return UIColor(hexString: "418CE0")
    }
    
    ///HEX 979DB5
    class var color_97: UIColor {
        return UIColor(hexString: "979DB5")
    }
    
    ///HEX 09BF62
    class var color_09: UIColor {
        return UIColor(hexString: "09BF62")
    }
    
    ///HEX EFF3FF
    class var color_EF: UIColor {
        return UIColor(hexString: "EFF3FF")
    }
    
    ///HEX D5DEFD
    class var color_D5: UIColor {
        return UIColor(hexString: "D5DEFD")
    }
    
    ///HEX EFF1FF
    class var color_EF1: UIColor {
        return UIColor(hexString: "EFF1FF")
    }
    
    ///HEX E1F7F8
    class var color_E1: UIColor {
        return UIColor(hexString: "E1F7F8")
    }
    
    ///HEX 2FB9C5
    class var color_2F: UIColor {
        return UIColor(hexString: "2FB9C5")
    }
    
    ///HEX F8A717
    class var color_F8: UIColor {
        return UIColor(hexString: "F8A717")
    }
    
    ///HEX F9EEDC
    class var color_F9: UIColor {
        return UIColor(hexString: "F9EEDC")
    }
    
    ///HEX F7B500
    class var color_F7: UIColor {
        return UIColor(hexString: "F7B500")
    }
    
    ///HEX E9EDFF
    class var color_E9: UIColor {
        return UIColor(hexString: "E9EDFF")
    }
    
    ///HEX FAB040
    class var color_FA: UIColor {
        return UIColor(hexString: "FAB040")
    }
    
    ///HEX 3752D2
    class var color_37: UIColor {
        return UIColor(hexString: "3752D2")
    }
    
    ///HEX EF9429
    class var color_EF9: UIColor {
        return UIColor(hexString: "EF9429")
    }
    
    ///HEX 42B23C
    class var color_42: UIColor {
        return UIColor(hexString: "42B23C")
    }
    
    ///HEX 8061E8
    class var color_80: UIColor {
        return UIColor(hexString: "8061E8")
    }
    
    /// 透明度为0.8的黑色
    class var color_TA8: UIColor {
        
        return UIColor(r: 0, g: 0, b: 0, a: 0.8)
    }
}
