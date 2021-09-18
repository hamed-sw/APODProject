//
//  ViewModel.swift
//  APODProject
//
//  Created by Hamed Amiry on 16.09.2021.
//

import UIKit

class ViewModel {
    var apodArry = [Elements]()
    var tableView = UITableView()
    var arry = [Elementtt]()
    
    func apiCall() {
        JsonParsing.apiCall { [weak self] data in
            switch data {
            case .success(let newData):
                for forDAta in newData {
                    if  forDAta.mediaType == Constants.image {
                        self?.arry.append(Elementtt(date: forDAta.date , explanation: forDAta.explanation , mediaType: forDAta.mediaType , url: forDAta.url ))
                    }
                }
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let erro):
                print(erro)
            }
            
        }
    }
    
    func downloadImage(string:String, image: ApodTableViewCell) {
        DownloadImage.imageDowloag(string: string) { data in
            guard let theImage = UIImage(data: data) else {return}
            DispatchQueue.main.async {
                image.apodImage.image = theImage
            }
        }
    }
  
}
