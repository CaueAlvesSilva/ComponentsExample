//
//  CardComponentTest.swift
//  AppComponents
//
//  Created by Cauê Alves on 25/09/19.
//  Copyright © 2019 ComponentsExample. All rights reserved.
//

@testable import AppComponents
import XCTest
import SnapshotTesting

class CardComponentTest: XCTestCase {
    
    let component: CardComponent = UIView.componentFromNib()
    
    func testBuildRender() {
        
        let dto = CardComponent.DTO(title: "This is an example title", content: "This is an example content", isFavorite: true)
        component.render(.build(dto))
        assertSnapshot(matching: component, as: .image)
    }
}
