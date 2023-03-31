//
//  KisiDetayInteractor.swift
//  KisilerViper
//
//  Created by Kadir Yılmaz on 22.03.2023.
//

import Foundation
import Alamofire

class KisiDetayInteractor: PresenterToInteractorKisiDetayProtocol {
    
    func kisiGuncelle(kisi_id: Int, kisi_ad: String, kisi_tel: String) {
        let parameters: Parameters = ["kisi_id": kisi_id, "kisi_ad": kisi_ad, "kisi_tel": kisi_tel]
        
        AF.request("https://kadiryilmazhatay.000webhostapp.com/kisilerWebService/update_kisiler.php", method: .post, parameters: parameters).response { response in
            if let data = response.data {
                do{
                    let cevap = try JSONSerialization.jsonObject(with: data)
                    print(cevap)
                }catch{print(error.localizedDescription)}
            }
        }
    }
    
    func kisiSil(kisi_id: Int) {
        
        let parameters: Parameters = ["kisi_id": kisi_id]
        
        AF.request("https://kadiryilmazhatay.000webhostapp.com/kisilerWebService/delete_kisiler.php", method: .post, parameters: parameters).response { response in
            if let data = response.data {
                do{
                    let cevap = try JSONSerialization.jsonObject(with: data)
                    print(cevap)
                }catch{print(error.localizedDescription)}
            }
        }
        
    }
    
    
}
