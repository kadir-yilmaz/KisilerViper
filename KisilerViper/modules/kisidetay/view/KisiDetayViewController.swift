//
//  KisiDetayViewController.swift
//  KisilerViper
//
//  Created by Kadir Yılmaz on 22.03.2023.
//

import UIKit

class KisiDetayViewController: UIViewController {

    @IBOutlet weak var kisiAdTextField: UITextField!
    @IBOutlet weak var kisiTelTextField: UITextField!
    
    var kisi: Kisi?
    
    var kisiDetayPresenterNesnesi: ViewToPresenterKisiDetayProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let k = kisi {
            kisiAdTextField.text = k.kisi_ad
            kisiTelTextField.text = k.kisi_tel
        }
        
        KisiDetayRouter.createModule(ref: self)

    }
    
    
    @IBAction func guncelleButonuTiklandi(_ sender: Any) {
        
        if let ka = kisiAdTextField.text, let kt = kisiTelTextField.text, let k = kisi {
            kisiDetayPresenterNesnesi?.guncelle(kisi_id: Int(k.kisi_id!)!, kisi_ad: ka, kisi_tel: kt)
        }
        
        
    }
    
    @IBAction func silButonuTiklandi(_ sender: Any) {
        if let k = kisi {
            self.kisiDetayPresenterNesnesi?.sil(kisi_id: Int(k.kisi_id!)!)
        }
    }
    
    
}
