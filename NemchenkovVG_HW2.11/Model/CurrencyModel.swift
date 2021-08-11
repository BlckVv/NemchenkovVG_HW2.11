//
//  CurrencyModel.swift
//  NemchenkovVG_HW2.11
//
//  Created by Владимир Немченков on 11.08.2021.
//

struct CurrencyModel: Decodable {
    var Date: String?
    var PreviousDate: String?
    var Timestamp: String?
    var Valute: [String: Valute]
    
    init(currencyData: [String: Any]) {
        Date = currencyData["Data"] as? String
        PreviousDate = currencyData["PreviousDate"] as? String
        Timestamp = currencyData["Timestamp"] as? String
        Valute = currencyData["Valute"] as! [String: Valute]
        }
    
    static func getCurrencies(from value: Any) -> [CurrencyModel] {
        guard let currenciesData = value as? [[String: Any]] else { return [] }
        return currenciesData.compactMap { CurrencyModel(currencyData: $0) }
    }
}

struct Valute: Decodable {
    var CharCode: String?
    var Nominal: Double?
    var Name: String?
    var Value: Double?
    var Previous: Double?
}
