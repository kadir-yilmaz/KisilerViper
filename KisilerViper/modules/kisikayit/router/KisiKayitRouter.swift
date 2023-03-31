//
//  KisiKayitRouter.swift
//  KisilerViper
//
//  Created by Kadir Yılmaz on 22.03.2023.
//

import Foundation

class KisiKayitRouter: PresenterToRouterKisiKayitProtocol {
    
    static func createModule(ref: KisiKayitViewController){
        ref.kisiKayitPresenterNesnesi = KisiKayitPresenter()
        ref.kisiKayitPresenterNesnesi?.kisiKayitInteractor = KisiKayitInteractor()
    }
    
}
