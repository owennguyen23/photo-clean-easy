//
//  UIColorExt.swift
//  PhotoCleanEasy
//
//  Created by Nguyen Anh Tuan on 14/5/25.
//

import UIKit

extension UIColor {
    convenience init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    
    //define hex Color
    static let c141414 = UIColor(hex: "#141414")
    static let cAAAAAA = UIColor(hex: "#AAAAAA")
    static let c50BD61 = UIColor(hex: "#50BD61")
    static let c292929 = UIColor(hex: "#292929")
    static let c3DD071 = UIColor(hex: "#3DD071")
    static let c7F7F7F = UIColor(hex: "#7F7F7F")
}
