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
    
    var picdate:String?
    var moreDetail:String?
    var imageDetail: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = picdate
        detailLabel.text = moreDetail
        detailImage.image = imageDetail
        

    }
    
    func details(viewModel:Elementtt) {
        picdate = viewModel.date
        moreDetail = viewModel.explanation
        DownloadImage.imageDowloag(string: viewModel.url) { [weak self] imageData in
            let imag = UIImage(data: imageData)
            DispatchQueue.main.async {
                self?.detailImage.image = imag
            }
        }
    }
    



}
