//
//  UiTestTutorialUITests.swift
//  UiTestTutorialUITests
//
//  Created by Alyona Bedrosova on 22.07.2023.
//

import XCTest

final class UiTestTutorialUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testModern() throws {
        // Запускаем приложение
        XCUIApplication().launch()
        
        let buttonView = ButtonsView()
        XCTAssert(buttonView.button1.exists)
        XCTAssert(buttonView.button2.exists)
        XCTAssert(buttonView.textField.exists)
        
        buttonView.button2.tap()
        buttonView.button1.tap()
        buttonView.textField.tap()
        
        buttonView.textField.typeText("Good day:)")
        
        XCTAssertEqual(buttonView.button1.label, "Button tapped")
    }
    
    func testController() throws {
        // Запускаем приложение
        XCUIApplication().launch()
        
        let listView = ListView()
        XCTAssert(listView.tableView.exists)
        
        listView.row(for: 3).tap()
        
        let buttonView = ButtonsView()
        XCTAssert(buttonView.button1.exists)
        XCTAssert(buttonView.button2.exists)
        XCTAssert(buttonView.textField.exists)
        
        buttonView.button2.tap()
        buttonView.button1.tap()
        buttonView.textField.tap()
        
        XCUIDevice.shared.orientation = .landscapeLeft
        
        buttonView.textField.typeText("Good day:)")
        
        XCUIDevice.shared.orientation = .portrait
        
        XCTAssertEqual(buttonView.button1.label, "Button tapped")
        
        let screenshot = XCUIApplication().screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = "My Great Screenshot"
        attachment.lifetime = .keepAlways
        add(attachment)
        
        // вернуться
        buttonView.popToRootController()
    }

//    func testExample() throws {
//        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launch()
//
//        // Поиск кнопки по идентификатору
////        let button1 = app.descendants(matching: .button)
////            .matching(identifier: "button1")
////            .element
//
//        // Поиск кнопки с помощью Predicate
//        let button1 = app.descendants(matching: .button)
//            .matching(NSPredicate(format: "identifier == %@", "button1"))
//            .element
//
//        // Поиск кнопки по индексу
//        // let button2 = app.buttons.element(boundBy: 1)
//
//        // Поиск кнопки по тексту
//        let button2 = app.buttons["Button two"]
//
//        // Проверяем что кнопка существует!
//        XCTAssert(button1.exists)
//        XCTAssert(button2.exists)
//        button1.tap()
//
//        XCTAssertEqual(button1.label, "Button tapped")
//
//        button2.tap()
//
//        let textField = app.textFields.firstMatch
//        XCTAssert(textField.exists)
//        textField.tap()
//
//        textField.typeText("Good morning!")
//
//
//    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
