//
//  KisiKayitViewController.swift
//  KisilerViper
//
//  Created by Kadir Yılmaz on 22.03.2023.
//

import UIKit

class KisiKayitViewController: UIViewController {

    @IBOutlet weak var kisiAdTextField: UITextField!
    @IBOutlet weak var kisiTelTextField: UITextField!
    
    var kisiKayitPresenterNesnesi: ViewToPresenterKisiKayitProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        KisiKayitRouter.createModule(ref: self)
        
    }
    
    @IBAction func kaydetButonuTiklandi(_ sender: Any) {
        
        if let ka = kisiAdTextField.text, let kt = kisiTelTextField.text {
            kisiKayitPresenterNesnesi?.ekle(kisi_ad: ka, kisi_tel: kt)
        }
    }
    
    
}
