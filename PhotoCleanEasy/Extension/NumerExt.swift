//
//  NumerExt.swift
//  PhotoCleanEasy
//
//  Created by Nguyen Anh Tuan on 19/5/25.
//

import UIKit
import Foundation

extension Int64 {

    func sizeFormat(_ binary: Bool = false, _ precision: Int = 1, showingUnit: Bool = true) -> String {
        return Float(self).sizeFormat(binary, precision, showingUnit)
    }

    func timeFormat() -> String {
        var seconds: Int64 = self
        let totalMinutes = floor(Float(seconds) / Float(60))

        seconds = seconds % 60
        let hours = Int(floor(totalMinutes / 60))
        let minutes = Int(totalMinutes) % 60

        return "\(hours > 0 ? "\(hours >= 10 ? String(hours) : "0\(hours)"):" : "")\(minutes >= 10 ? String(minutes) : "0\(minutes)"):\(seconds >= 10 ? String(seconds) : "0\(seconds)")"
    }
}

extension Float {
    func toFixed(_ precision: Int) -> Float {
        return Float(Double(self).toFixed(precision))
    }
    
    func sizeFormat(_ binary: Bool = false, _ precision: Int = 1, _ showingUnit: Bool = true) -> String {
        let base: Float = binary ? 1024 : 1000
        if self == 1 {
            return "1 Byte"
        }
        else if self < base {
            return String(self) + " Bytes"
        }
        let prefixes: [String] = [
            (binary ? "KiB" : "kB"),
            (binary ? "MiB" : "MB"),
            (binary ? "GiB" : "GB"),
            (binary ? "TiB" : "TB"),
            (binary ? "PiB" : "PB"),
            (binary ? "EiB" : "EB"),
            (binary ? "ZiB" : "ZB"),
            (binary ? "YiB" : "YB"),
        ]

        let index = Int(Darwin.floor(log(Double(self)) / log(Double(base))))
        return String((Float(self) / pow(Float(base), Float(index))).toFixed(precision)) + " " + (showingUnit ? prefixes[index - 1] : "")
    }
}

extension Double {
    func toFixed(_ precision: Int) -> Double {
        let _p = pow(Double(10), Double(precision))
        return (_p * self).rounded() / _p
    }
}

