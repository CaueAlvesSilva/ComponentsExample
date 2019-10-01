//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

@testable import AppComponents
import XCTest
import SnapshotTesting

class ___VARIABLE_componentName___ComponentTest: XCTestCase {
    
    let component: ___VARIABLE_componentName___Component = UIView.componentFromNib()
    
    func testBuildRender() {
        
        #warning("Delete after first run")
        record = true
        
        let dto = ___VARIABLE_componentName___Component.DTO()
        component.render(.build(dto))
        assertSnapshot(matching: component, as: .image)
    }
}
