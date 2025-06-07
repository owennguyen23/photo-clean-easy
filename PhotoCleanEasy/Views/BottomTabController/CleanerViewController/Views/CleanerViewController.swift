import UIKit
import SnapKit
import RxSwift

class CleanerViewController: BaseViewController {
    
    private let disposeBag = DisposeBag()
    private let cleanerViewModel = CleanerViewModel()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .c141414
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var viewStorageUsage: UIView = {
        let view = UIView()
        view.backgroundColor = .c292929
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var progressCircleView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var titleStorageUsage: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .center
        label.text = "Storage Usage"
        return label
    }()
    
    private lazy var titleDiskSpace: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.textAlignment = .center
        label.text = "51 / 63 GB used"
        return label
    }()
    
    private lazy var buttonSmartScan: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Smart Scan", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        button.backgroundColor = .c3DD071
        button.layer.cornerRadius = 10
        return button
    }()
    
    private lazy var featureStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var photoCleaningCardUIView: UIView = {
        let view = UIView()
        view.backgroundColor = .c292929
        view.layer.cornerRadius = 10
        return view
    }()
    private lazy var compressMediaCardUIView: UIView = {
        let view = UIView()
        view.backgroundColor = .c292929
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var photoCleaningImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "icPhotoCleaning") // Replace with your image asset name
        return imageView
    }()
    
    private lazy var photoCleaningLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 2
        label.text = "Photos Cleaning"
        return label
    }()
    
    private lazy var compressImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "icCompressMedia")
        return imageView
    }()
    
    private lazy var compressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 2
        label.text = "Compress Media"
        return label
    }()
    
    private var circularProgressView: CircularProcessView!
    
    override func initUI() {
        super.initUI()
        view.backgroundColor = .c141414
        self.cleanerViewModel.requestPhotoLibraryPermission()
        setupView()
    }
    
    private func setupView() {
        circularProgressView = CircularProcessView()
        
        circularProgressView.value = Float(Double(UIDevice.current.usedDiskSpaceInBytes) / Double(UIDevice.current.totalDiskSpaceInBytes))
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        //contentView
        contentView.addSubview(viewStorageUsage)
        contentView.addSubview(featureStackView)
        
        //viewstorageUsage
        viewStorageUsage.addSubview(progressCircleView)
        viewStorageUsage.addSubview(titleStorageUsage)
        viewStorageUsage.addSubview(titleDiskSpace)
        viewStorageUsage.addSubview(buttonSmartScan)
        
        //hStackView
        featureStackView.addArrangedSubview(photoCleaningCardUIView)
        featureStackView.addArrangedSubview(compressMediaCardUIView)
        
        progressCircleView.addSubview(circularProgressView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.bottom.greaterThanOrEqualTo(featureStackView.snp.bottom).offset(20)
        }
        
        viewStorageUsage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(127)
        }
        
        
        progressCircleView.snp.makeConstraints { make in
            make.width.height.equalTo(103)
            make.centerY.equalToSuperview()
            make.leading.equalTo(viewStorageUsage.snp.leading).inset(24)
        }
        
        titleStorageUsage.snp.makeConstraints { make in
            make.top.equalTo(progressCircleView.snp.top).inset(15)
            make.leading.equalTo(progressCircleView.snp.trailing).inset(25)
            make.trailing.equalToSuperview().inset(-5)
        }
        
        titleDiskSpace.snp.makeConstraints { make in
            make.top.equalTo(titleStorageUsage.snp.bottom).inset(-7)
            make.leading.equalTo(progressCircleView.snp.trailing).inset(25)
            make.trailing.equalToSuperview().inset(-5)
        }
        
        buttonSmartScan.snp.makeConstraints { make in
            make.top.equalTo(titleDiskSpace.snp.bottom).inset(-7)
            make.leading.equalTo(progressCircleView.snp.trailing).inset(-25)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(35)
        }
        
        titleDiskSpace.text = cleanerViewModel.caculatorDiskSpaceInBytes()
        
        featureStackView.snp.makeConstraints { make in
            make.top.equalTo(viewStorageUsage.snp.bottom).inset(-20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(72)
        }
        
        // photoCleaningCardUIView
        photoCleaningCardUIView.addSubview(photoCleaningImageView)
        photoCleaningCardUIView.addSubview(photoCleaningLabel)
        
        photoCleaningCardUIView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleNavigateToPhotoCleaning)))
        
        photoCleaningImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(40) // Adjust size as needed
        }
        
        photoCleaningLabel.snp.makeConstraints { make in
            make.leading.equalTo(photoCleaningImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
        }
        
        compressMediaCardUIView.addSubview(compressImageView)
        compressMediaCardUIView.addSubview(compressLabel)
        
        compressImageView.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(10)
        }
        
        compressLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(compressImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        
        circularProgressView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
    }
    
    override func unmount() {
        super.unmount()
    }
    
    @objc private func handleNavigateToPhotoCleaning() {
        let photoCleaningVCViewController = PhotoCleaningVCViewController()
        photoCleaningVCViewController.hidesBottomBarWhenPushed = true
        self.navigationPush(photoCleaningVCViewController)
    }
}
