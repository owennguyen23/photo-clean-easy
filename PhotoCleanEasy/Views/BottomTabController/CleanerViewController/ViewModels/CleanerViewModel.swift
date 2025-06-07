//
//  CleanerViewModel.swift
//  PhotoCleanEasy
//
//  Created by Nguyen Anh Tuan on 19/5/25.
//

import UIKit
import Photos

class CleanerViewModel {
    
    public func caculatorDiskSpaceInBytes() -> String {
        let usedSpaceInBytes = UIDevice.current.usedDiskSpaceInBytes.sizeFormat(showingUnit: false)
        let totalSpaceInBytes = UIDevice.current.totalDiskSpaceInBytes.sizeFormat(showingUnit: false)
        return "\(usedSpaceInBytes) / \(totalSpaceInBytes) GB used"
    }
    
    
    func requestPhotoLibraryPermission() {
        PHPhotoLibrary.requestAuthorization { status in
            switch status {
            case .authorized:
                print("Đã được cấp quyền truy cập thư viện ảnh")
                // Tiến hành fetch ảnh
            case .denied, .restricted:
                print("Quyền truy cập bị từ chối")
            case .notDetermined:
                print("Quyền chưa được xác định")
            case .limited:
                print("Quyền truy cập giới hạn")
            @unknown default:
                break
            }
        }
    }
    
}
