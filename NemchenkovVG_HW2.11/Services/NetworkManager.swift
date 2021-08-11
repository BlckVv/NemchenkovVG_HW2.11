//
//  NetworkManager.swift
//  NemchenkovVG_HW2.11
//
//  Created by Владимир Немченков on 11.08.2021.
//
import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchCurrency(from url: String?, with complition: @escaping (CurrencyModel, [Valute]) -> Void) {
        guard let stringURL = url else { return }
        guard let url = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let data = try JSONDecoder().decode(CurrencyModel.self, from: data)
                let currency = data.Valute.map {$0.value}
                
                DispatchQueue.main.async {
                    complition(data, currency)
                }
            } catch let error {
                print(error.localizedDescription)
                
            }
        }.resume()
    }
}
