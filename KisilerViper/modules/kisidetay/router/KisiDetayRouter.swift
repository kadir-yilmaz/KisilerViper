//
//  KisiDetayRouter.swift
//  KisilerViper
//
//  Created by Kadir Yılmaz on 22.03.2023.
//

import Foundation

class KisiDetayRouter: PresenterToRouterKisiDetayProtocol {
    
    static func createModule(ref: KisiDetayViewController) {
        ref.kisiDetayPresenterNesnesi = KisiDetayPresenter()
        ref.kisiDetayPresenterNesnesi?.kisiDetayInteractor = KisiDetayInteractor()
    }
    
    
}
