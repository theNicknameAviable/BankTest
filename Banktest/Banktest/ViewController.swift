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
    var data1: [responseMarvel] = []
    var data2: [DataClass] = []
    var data3: [Result] = []

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

extension ViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data3.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? characterCell
        cell?.character.text = "Character: \(data3[indexPath.row].name)"

    if data3[indexPath.row].isvalid {
        cell?.lineView.backgroundColor = UIColor(red: 0.37, green: 0.56, blue: 0.22, alpha: 1.00)
        cell?.arrowImageView.tintColor = UIColor(red: 0.37, green: 0.56, blue: 0.22, alpha: 1.00)
    } else {
        cell?.lineView.backgroundColor = UIColor(red: 0.56, green: 0.04, blue: 0.11, alpha: 1.00)
        cell?.arrowImageView.tintColor = UIColor(red: 0.56, green: 0.04, blue: 0.11, alpha: 1.00)
    }
 
    if let celda = cell {
        return celda
    }
    return UITableViewCell()
    }
}

