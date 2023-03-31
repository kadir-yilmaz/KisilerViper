//
//  ViewController.swift
//  KisilerViper
//
//  Created by Kadir Yılmaz on 22.03.2023.
//

import UIKit

class AnasayfaViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var kisiler = [Kisi]()
    
    var anasayfaPresenterNesnesi: ViewToPresenterAnasayfaProtocol?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        AnasayfaRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.kisileriYukle()
    }


}

extension AnasayfaViewController: PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(kisilerListesi: Array<Kisi>) {
        self.kisiler = kisilerListesi
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
}

extension AnasayfaViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        anasayfaPresenterNesnesi?.ara(aramaKelimesi: searchText)
    }
}

extension AnasayfaViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        kisiler.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let kisi = kisiler[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "kisiTableViewCell", for: indexPath) as! KisiTableViewCell
        
        cell.kisiAdLabel.text = "\(kisi.kisi_ad!)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kisi = kisiler[indexPath.row]
        
        performSegue(withIdentifier: "toKisiDetayVC", sender: kisi)
        
        tableView.deselectRow(at: indexPath, animated: true) // tıklama izini kaldırır
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toKisiDetayVC" {
            let kisi = sender as? Kisi
            let destination = segue.destination as! KisiDetayViewController
            destination.kisi = kisi
        }
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let araAction = UIContextualAction(style: .destructive, title: "Ara"){
                    (UIContextualAction, view, boolValue) in
            
            print("Aranıyor")
                                
        }
        
        return UISwipeActionsConfiguration(actions: [araAction])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let mesajAction = UIContextualAction(style: .normal, title: "Mesaj"){
                    (UIContextualAction, view, boolValue) in
            
            print("Mesaj gönderildi")
                                
        }
        
        return UISwipeActionsConfiguration(actions: [mesajAction])
    }
    
}

