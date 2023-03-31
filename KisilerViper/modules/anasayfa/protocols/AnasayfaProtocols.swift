//
//  AnasayfaProtocols.swift
//  KisilerViper
//
//  Created by Kadir Yılmaz on 22.03.2023.
//

import Foundation

protocol ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol? {get set}
    var anasayfaView: PresenterToViewAnasayfaProtocol? {get set}

    
    func kisileriYukle()
    func ara(aramaKelimesi: String)
}

protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol? {get set}
    
    func tumKisileriAl()
    func kisiAra(aramaKelimesi: String)
}

protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(kisilerListesi: Array<Kisi>)
}

protocol PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(kisilerListesi: Array<Kisi>)
}

protocol PresenterToRouterAnasayfaProtocol {
    static func createModule(ref: AnasayfaViewController)
}
