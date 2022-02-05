//
//  ViewController.swift
//  Banktest
//
//  Created by Raul Bautista on 1/2/22.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func fetchInfo() {
        
        let url = "https://"
        AF.request(url, method: .get, parameters: nil, headers: nil).responseData { response in
            //aquí llega la respuesta del servidor.
            switch response.result {
            case .success(<#T##Data#>):
                print("Validation Successful")
            case let . failure(error):
                print(error)
            }
        }
        
    }



}

//MARK: - TABLE

extension ViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}

