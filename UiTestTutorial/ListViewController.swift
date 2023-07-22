//
//  ListViewController.swift
//  UiTestTutorial
//
//  Created by Alyona Bedrosova on 22.07.2023.
//

import UIKit

class ListViewController: UIViewController {
    
    private let tableView = UITableView()
    private var items = [Item]()
    
    struct Item {
        var id: Int
        var text: String
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        makeLayout()
        makeFakeItems()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func makeFakeItems() {
        Array(0..<10).forEach {
        items.append(.init(id: $0, text: "Item #\($0)"))
        }
    }
    
    private func makeLayout() {
        view.addSubview(tableView)
        tableView.frame = view.frame
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var configuration = cell.defaultContentConfiguration()
        configuration.text = items[indexPath.row].text
        configuration.secondaryText = "id: \(items[indexPath.row].id)"
        cell.contentConfiguration = configuration
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
