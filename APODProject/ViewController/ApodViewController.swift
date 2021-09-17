//
//  ApodViewController.swift
//  APODProject
//
//  Created by Hamed Amiry on 16.09.2021.
//

import UIKit

class ApodViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var viewModel = ViewModel()
   // let db = DatabaseFetch()
    var newArr = [Elements]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.tableView = self.tableView
        viewModel.apiCall()
        registerCell()

    }
    
    func registerCell() {
        tableView.register(UINib(nibName: Constants.ApodTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.ApodTableViewCell)
    }
}

extension ApodViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ApodTableViewCell, for: indexPath) as? ApodTableViewCell else { fatalError()}
        let thne = viewModel.arry[indexPath.row]
        cell.config(viewModel: thne)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if  let detail: ApodDetailViewController = self.storyboard?.instantiateViewController(identifier: Constants.ApodDetailViewController) as? ApodDetailViewController {
            let newdata = viewModel.arry[indexPath.row]
            print(newdata.date)
            detail.details(viewModel: newdata)
            self.navigationController?.pushViewController(detail, animated: true)

        }
    }
    
}
