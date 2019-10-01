//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit

public protocol ___VARIABLE_componentName___ComponentDelegate: class {
}

/// ![Snapshot](../img/___VARIABLE_componentName___ComponentTest/testBuildRender.1.png)

public class ___VARIABLE_componentName___Component: UIView, ComponentType {

    /// :nodoc:
    public typealias Delegate = ___VARIABLE_componentName___ComponentDelegate
    public weak var delegate: ___VARIABLE_componentName___ComponentDelegate?

    /// :nodoc:
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension ___VARIABLE_componentName___Component {

    public enum RenderType {
        case build(DTO)
    }

    public func render(_ type: ___VARIABLE_componentName___Component.RenderType) {
        switch type {
        case .build(let dto):
            print(dto.value)
        }
    }
}

extension ___VARIABLE_componentName___Component {

    public struct DTO {

        var value: String
        
        public init(value: String) {
            self.value = value
        }
    }
}
