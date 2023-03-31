//
//  KisiDetayPresenter.swift
//  KisilerViper
//
//  Created by Kadir Yılmaz on 22.03.2023.
//

import Foundation

class KisiDetayPresenter: ViewToPresenterKisiDetayProtocol {
    
    var kisiDetayInteractor: PresenterToInteractorKisiDetayProtocol?
    
    func guncelle(kisi_id: Int, kisi_ad: String, kisi_tel: String) {
        kisiDetayInteractor?.kisiGuncelle(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
    }
    
    func sil(kisi_id: Int) {
        kisiDetayInteractor?.kisiSil(kisi_id: kisi_id)
    }
    
    
    
}
