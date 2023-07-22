//
//  ButtonsView.swift
//  UiTestTutorial
//
//  Created by Alyona Bedrosova on 22.07.2023.
//

import XCTest

struct ButtonsView {
    
    private let app = XCUIApplication()
    
    var button1: XCUIElement {
        app.descendants(matching: .button)
            .matching(identifier: "button1")
            .element
    }
    
    var button2: XCUIElement {
        app.buttons.element(boundBy: 1)
    }
    
    var textField: XCUIElement {
        app.textFields.firstMatch
    }
    
    func popToRootController() {
        app.navigationBars.buttons.element(boundBy: 0).tap()
    }
    
}
