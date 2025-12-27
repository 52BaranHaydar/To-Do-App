//
//  GorevViewController.swift
//  ToDoApp
//
//  Created by Baran on 26.12.2025.
//

import UIKit


protocol GorevEkleDelegate: AnyObject {
    func gorevEklendi(yeniGorev: Gorev)
}

class GorevViewController: UIViewController {
    
    
    @IBOutlet weak var yorumTextField: UITextView!
    @IBOutlet weak var gorevTextField: UITextField!
    
    
    weak var delegate: GorevEkleDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    @IBAction func gorevEkle(_ sender: Any) {
        
        if let baslik = gorevTextField.text, !baslik.isEmpty,
           let yorum = yorumTextField.text {
            
            let yeniGorev = Gorev(baslık: baslik, aciklama: yorum)
            
            delegate?.gorevEklendi(yeniGorev: yeniGorev)
            
            self.navigationController?.popViewController(animated: true)
 
        } else{
            
            let alert = UIAlertController(title: "Hata", message: "Lütfen bir görev başlığı giriniz", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
    }
    
}
