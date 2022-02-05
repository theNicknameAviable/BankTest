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
    static let host: String = "https://gateway.marvel.com"

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func fetchInfo() {
        
        let timeStamp = String(format: "%.f", Date().timeIntervalSince1970)
        let publicKey = "1de4fe3d3a6a89ba1e61bb34889865f1"
        let privateKey = "8074772204a5fa9445ca96c81837f2b6d85b546b"
        let auth = "?ts=\(timeStamp)1&apikey=1234&hash=ffd275c5130566a2916217b101f26150"
        let url = "\(Self.host)/v1/public/characters\(auth)"
        
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

