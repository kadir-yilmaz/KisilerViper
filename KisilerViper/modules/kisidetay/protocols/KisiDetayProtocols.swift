//
//  KisiDetayProtocols.swift
//  KisilerViper
//
//  Created by Kadir Yılmaz on 22.03.2023.
//

import Foundation

protocol ViewToPresenterKisiDetayProtocol {
    
    var kisiDetayInteractor: PresenterToInteractorKisiDetayProtocol? {get set}
    
    func guncelle(kisi_id: Int, kisi_ad: String, kisi_tel: String)
    func sil(kisi_id:Int)
}

protocol PresenterToInteractorKisiDetayProtocol {
    func kisiGuncelle(kisi_id: Int, kisi_ad: String, kisi_tel: String)
    func kisiSil(kisi_id:Int)
}

protocol PresenterToRouterKisiDetayProtocol {
    static func createModule(ref: KisiDetayViewController)
}
