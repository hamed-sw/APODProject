//
//  DetailViewModel.swift
//  APODProject
//
//  Created by Hamed Amiry on 18.09.2021.
//

import UIKit

class DetailViewModel {
    
    
    func callTheImageIntoDetail(string:String, thedetail:ApodDetailViewController) {
        DownloadImage.imageDowloag(string: string) { data in
            guard let theImage = UIImage(data: data) else {return}
            DispatchQueue.main.async {
                thedetail.detailImage.image = theImage
                
            }
        }
    }
}
