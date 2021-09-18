//
//  ApodTableViewCell.swift
//  APODProject
//
//  Created by Hamed Amiry on 16.09.2021.
//

import UIKit

class ApodTableViewCell: UITableViewCell {

    @IBOutlet weak var mediatypelabel: UILabel!
    @IBOutlet weak var apodImage: UIImageView!
    lazy var viewModel = ViewModel()
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

    }
    
//    func config(viewModel:Elementtt){
//        DownloadImage.imageDowloag(string: viewModel.url) {[weak self] data in
//            let img = UIImage(data: data)
//            DispatchQueue.main.async {
//                self?.apodImage.image = img
//            }
//            
//        }
//    }
    
    func cc( viewd:Elementtt) {
        viewModel.downloadImage(string: viewd.url, image: self)
    }
    
}
