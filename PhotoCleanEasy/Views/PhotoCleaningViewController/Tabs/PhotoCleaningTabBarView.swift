//
//  PhotoCleaningTabBarView.swift
//  PhotoCleanEasy
//
//  Created by Nguyen Anh Tuan on 3/6/25.
//

import UIKit
import SnapKit

protocol PhotoCleaningTabBarViewDelegate: AnyObject {
    func didSelectTab(at index: Int)
}

class PhotoCleaningTabBarView: UIView {
    
    @IBOutlet weak var smartAlbumsView: UIView!
    @IBOutlet weak var photoLibraryView: UIView!
    @IBOutlet weak var smartAlbumButton: UIButton!
    @IBOutlet weak var photoLibraryButton: UIButton!
    @IBOutlet weak var smartAlbLine: UIView!
    @IBOutlet weak var photoLibLine: UIView!
    
    private var selectedIndex: Int = 0
    
    public var delegate: PhotoCleaningTabBarViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .red
    }
    
    private func initUI() {
        self.loadFromNib()
        [smartAlbumsView, photoLibraryView].forEach {
            $0?.backgroundColor = .c292929
        }
        smartAlbLine.backgroundColor = .c50BD61
        photoLibLine.backgroundColor = .clear
        smartAlbumButton.tintColor = .white
        photoLibraryButton.tintColor = .c7F7F7F
    }
    
    private func changeColorButtonWhenSelected(at index: Int = 0) {
        guard let delegate = delegate else { return }
        delegate.didSelectTab(at: index)
        self.selectedIndex = index
        
        let items: [(button: UIButton?, line: UIView?)] = [
            (button: smartAlbumButton, line: smartAlbLine),
            (button: photoLibraryButton, line: photoLibLine)
        ]
        
        items.enumerated().forEach { (i, item) in
            let isSelected = i == selectedIndex
            item.button?.tintColor = isSelected ? .white : .c7F7F7F
            item.line?.backgroundColor = isSelected ? .c50BD61 : .clear
        }
        
    }
    
    @IBAction func onSelectSmartAlbums(_ sender: Any) {
        changeColorButtonWhenSelected(at: 0)
    }
    
    @IBAction func onSelectPhotoLib(_ sender: Any) {
        changeColorButtonWhenSelected(at: 1)
    }
    
}
