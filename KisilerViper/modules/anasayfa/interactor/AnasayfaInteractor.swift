//
//  AnasayfaInteractor.swift
//  KisilerViper
//
//  Created by Kadir Yılmaz on 22.03.2023.
//

import Foundation
import Alamofire

class AnasayfaInteractor: PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    func tumKisileriAl() {
        
        AF.request("https://kadiryilmazhatay.000webhostapp.com/kisilerWebService/tum_kisiler.php", method: .get).response { response in
            
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data)
                    
                    if let liste = cevap.kisiler {
                        self.anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
                    }
                    
                }catch{
                    print(error.localizedDescription)
                }
                
            }
            
        }
        
    }
    
    func kisiAra(aramaKelimesi: String) {
        let parameters: Parameters = ["kisi_ad": aramaKelimesi]
        AF.request("https://kadiryilmazhatay.000webhostapp.com/kisilerWebService/kisi_ara.php", method: .post, parameters: parameters).response { response in
            
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data)
                    
                    if let liste = cevap.kisiler {
                        self.anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
                    }
                    
                }catch{
                    print(error.localizedDescription)
                }
                
            }
            
        }
    }
    
}
