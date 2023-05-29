//
//  ResultViewController.swift
//  POSTRequest-Alamofire
//
//  Created by cumulations on 29/05/23.
//

import UIKit

class ResultViewController: UIViewController {
    
    var trainData = [TrainModel]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ResultViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trainData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MyTableViewCell
        cell?.trainName.text = trainData[indexPath.row].name
        cell?.trainNumber.text = String(trainData[indexPath.row].train_num)
        cell?.trainTo.text = trainData[indexPath.row].train_to
        cell?.trainFrom.text = trainData[indexPath.row].train_from
        cell?.arrivalTime.text = trainData[indexPath.row].data.arriveTime
        cell?.departureTime.text = trainData[indexPath.row].data.departTime
        return cell!
    }
    
    
}
