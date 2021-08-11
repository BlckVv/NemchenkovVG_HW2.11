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
}

struct Valute: Decodable {
    var CharCode: String?
    var Nominal: Double?
    var Name: String?
    var Value: Double?
    var Previous: Double?
}
