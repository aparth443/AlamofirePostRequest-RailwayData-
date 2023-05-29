//
//  ViewController.swift
//  POSTRequest-Alamofire
//
//  Created by cumulations on 29/05/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTextField: UITextField!
    
    @IBOutlet weak var myBtn: UIButton!
    
    
    var trainData = [TrainModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let trainText = myTextField.text else{
            return
        }
        let parameterData = Model(search: trainText)
        APIHandler.instance.sendingPostRequest(parameters: parameterData) { result in
            self.trainData = result
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? ResultViewController
        vc?.trainData = trainData
    }
    

}

