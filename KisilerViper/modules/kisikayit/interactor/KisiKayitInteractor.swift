//
//  KisiKayitInteractor.swift
//  KisilerViper
//
//  Created by Kadir Yılmaz on 22.03.2023.
//

import Foundation
import Alamofire

class KisiKayitInteractor: PresenterToInteractorKisiKayitProtocol {
    func kisiEkle(kisi_ad: String, kisi_tel: String){
        let parameters: Parameters = ["kisi_ad": kisi_ad, "kisi_tel": kisi_tel]
        
        AF.request("https://kadiryilmazhatay.000webhostapp.com/kisilerWebService/insert_kisiler.php", method: .post, parameters: parameters).response { response in
            
            if let data = response.data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        print(json)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
            
        }
    }
}
