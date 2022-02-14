//
//  ViewController.swift
//  Banktest
//
//  Created by Raul Bautista on 1/2/22.
//

import UIKit
import Alamofire

class ViewController: UIViewController/*, UITableViewDelegate, UITableViewDataSource*/ {
    
    @IBOutlet weak var table: UITableView!
    static let host: String = "https://gateway.marvel.com"

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchInfo()
        
    }
    
    func fetchInfo() {
        
        let timeStamp = String(format: "%.f", Date().timeIntervalSince1970)
        let publicKey = "1de4fe3d3a6a89ba1e61bb34889865f1"
        let privateKey = "8074772204a5fa9445ca96c81837f2b6d85b546b"
        let hash = String(format: "%@%@%@", timeStamp, privateKey, publicKey)
        let hasMD5 = hash.md5()
        let auth = "?ts=\(timeStamp)&apikey=\(publicKey)&hash=\(hasMD5)"
        let url = "\(Self.host)/v1/public/characters\(auth)"
        
        AF.request(url)
            .responseDecodable(of: responseMarvel.self) {response in
            //aquí llega la respuesta del servidor.
                print(response.value)
                if let value = response.value {
                    //funciona y recarga
                } else {
                    // mostrar error
                }
                let characters = response.value?.data ?? []
                //tableView.reloadData()
        }
        
    }

}

//MARK: - TABLE
/*
extension ViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}*/


// MARK: - Instruction
struct responseMarvel: Codable {
    let code: Int
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let id: Int
    let name, resultDescription: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
    }
}

