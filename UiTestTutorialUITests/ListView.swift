//
//  ListView.swift
//  UiTestTutorialUITests
//
//  Created by Alyona Bedrosova on 22.07.2023.
//

import XCTest

struct ListView {
    let app = XCUIApplication()
    
    var tableView: XCUIElement {
        app.tables.firstMatch
    }
    
    func row(for index: Int) -> XCUIElement {
        //быстрее чем descendants
        tableView.children(matching: .cell).element(boundBy: index)
    }
}
