//
//  CardComponent.swift
//  AppComponents
//
//  Created by Cauê Alves on 24/09/19.
//  Copyright © 2019 ComponentsExample. All rights reserved.
//

import UIKit
import UIView_Shimmer

public protocol CardComponentDelegate: class {
    
    func cardComponentDidTapFavoriteButton(_ component: CardComponent)
}

/// ![Snapshot](../img/CardComponentTest/testBuildRender.1.png)

public class CardComponent: UIView, ComponentType {

    /// :nodoc:
    public typealias Delegate = CardComponentDelegate
    public weak var delegate: CardComponentDelegate?
    
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var contentLabel: UILabel?
    @IBOutlet private weak var favoriteButton: UIButton?
    
    /// :nodoc:
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction private func didTapFavoriteButton() {
        self.delegate?.cardComponentDidTapFavoriteButton(self)
    }
}

extension CardComponent {

    public enum RenderType {
        
        case build(DTO)
        case loading(Bool)
        case favorite(Bool)
    }

    public func render(_ type: CardComponent.RenderType) {
        switch type {
        case .build(let dto):
            titleLabel?.text = dto.title
            contentLabel?.text = dto.content
            setFavoriteImage(dto.isFavorite)
            
        case .loading(let isLoading):
            titleLabel?.backgroundColor = isLoading ? UIColor(named: .background) : UIColor.white
            titleLabel?.textColor = isLoading ? UIColor.clear : UIColor(named: .title)
            isLoading ? titleLabel?.startShimmering() : titleLabel?.stopShimmering()
            
            contentLabel?.backgroundColor = isLoading ? UIColor(named: .background) : UIColor.white
            contentLabel?.textColor = isLoading ? UIColor.clear : UIColor(named: .content)
            isLoading ? contentLabel?.startShimmering() : contentLabel?.stopShimmering()
                        
            favoriteButton?.isHidden = isLoading
            
        case .favorite(let isFavorite):
            setFavoriteImage(isFavorite)
        }
    }
    
    private func setFavoriteImage(_ isFavorite: Bool) {
        let imageName = isFavorite ? "ic_favorite_on" : "ic_favorite_off"
        let image = UIImage(named: imageName, in: Bundle(for: CardComponent.self), compatibleWith: nil)
        favoriteButton?.setImage(image, for: .normal)
    }
}

extension CardComponent {

    public struct DTO {

        var title: String
        var content: String
        var isFavorite: Bool
        
        public init(title: String, content: String, isFavorite: Bool) {
            self.title = title
            self.content = content
            self.isFavorite = isFavorite
        }
    }
}

