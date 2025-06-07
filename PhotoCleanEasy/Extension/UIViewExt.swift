//
//  UIViewExt.swift
//  PhotoCleanEasy
//
//  Created by Nguyen Anh Tuan on 4/6/25.
//
import UIKit

extension UIView {
    @discardableResult
    func loadFromNib() -> UIView? {
        guard let view = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView else { return nil }
        view.frame = bounds
        addSubview(view)
        return view
    }
}
