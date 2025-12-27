//
//  ViewController.swift
//  ToDoApp
//
//  Created by Baran on 25.12.2025.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, GorevEkleDelegate{
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var baslikLabel: UILabel!
    
    var gorevListesi : [Gorev] = []
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

    }


    @IBAction func gorev(_ sender: Any) {
        
        performSegue(withIdentifier: "toGorevVC", sender: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gorevListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let gorev = gorevListesi[indexPath.row]
        
        cell.textLabel?.text = gorev.baslık
        cell.detailTextLabel?.text = gorev.aciklama
        
        cell.accessoryType = gorev.yapildiMi ? .checkmark : .none
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? GorevViewController{
            destinationVC.delegate = self
        }
        
    }
    
    func gorevEklendi(yeniGorev: Gorev) {
        gorevListesi.append(yeniGorev)
        tableView.reloadData()
    }
    
}

