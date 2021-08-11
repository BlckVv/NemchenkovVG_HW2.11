//
//  CurrencyTableViewController.swift
//  NemchenkovVG_HW2.11
//
//  Created by Владимир Немченков on 11.08.2021.
//

import UIKit

class CurrencyTableViewController: UITableViewController {
    
    private var data: CurrencyModel!
    private var currency: [Valute] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 200
        fetchCurrency(from: "https://www.cbr-xml-daily.ru/daily_json.js")
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currency.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CurrencyTableViewCell
        
        cell.currencyInfoLabel.text = """
            Date: \(data.Date ?? "0")
            Previous date \(data.PreviousDate ?? "0")
            Timestamp \(data.Timestamp ?? "0")
            Valute \(currency[indexPath.row])
            """
        
        
        
        return cell
    }
    
    private func fetchCurrency(from url: String?) {
        NetworkManager.shared.fetchCurrency(from: url) {  data, currency in
            self.data = data
            self.currency = currency
            self.tableView.reloadData()
        }
    }
}
