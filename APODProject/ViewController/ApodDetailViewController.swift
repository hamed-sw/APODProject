//
//  ApodDetailViewController.swift
//  APODProject
//
//  Created by Hamed Amiry on 16.09.2021.
//

import UIKit

class ApodDetailViewController: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    lazy var viewModel = DetailViewModel()
    
    var picdate:String?
    var moreDetail:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = picdate
        detailLabel.text = moreDetail
        

    }
    
//    func details(viewModel:Elementtt) {
//        picdate = viewModel.date
//        moreDetail = viewModel.explanation
//        DownloadImage.imageDowloag(string: viewModel.url) { [weak self] imageData in
//            let imag = UIImage(data: imageData)
//            DispatchQueue.main.async {
//                self?.detailImage.image = imag
//            }
//        }
//    }
    
    func configer(fromViewModel: Elementtt) {
        picdate = fromViewModel.date
        moreDetail = fromViewModel.explanation
        viewModel.callTheImageIntoDetail(string: fromViewModel.url, thedetail: self)
    }

}
