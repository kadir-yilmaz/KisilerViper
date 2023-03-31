//
//  KisiKayitProtocols.swift
//  KisilerViper
//
//  Created by Kadir Yılmaz on 22.03.2023.
//

import Foundation

protocol ViewToPresenterKisiKayitProtocol {
    
    var kisiKayitInteractor: PresenterToInteractorKisiKayitProtocol? {get set}
    
    func ekle(kisi_ad: String, kisi_tel: String)
}

protocol PresenterToInteractorKisiKayitProtocol {
    func kisiEkle(kisi_ad: String, kisi_tel: String)
}

protocol PresenterToRouterKisiKayitProtocol {
    static func createModule(ref: KisiKayitViewController)
}
