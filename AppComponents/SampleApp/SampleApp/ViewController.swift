//
//  ViewController.swift
//  SampleApp
//
//  Created by Cauê Alves on 20/09/19.
//  Copyright © 2019 ComponentsExample. All rights reserved.
//

import UIKit
import AppComponents

class ViewController: UIViewController {

    @IBOutlet private weak var componentContainerView: UIView!
    
    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var contentTextField: UITextField!
    @IBOutlet private weak var favoriteSwitch: UISwitch!
    @IBOutlet private weak var loadingSwitch: UISwitch!
    
    private var timer = Timer()
    
    private lazy var cardComponent: CardComponent = {
        let component: CardComponent = UIView.componentFromNib()
        component.delegate = self
        return component
    }()
    
    private var componentDTO: CardComponent.DTO {
        return .init(title: titleTextField.text ?? "",
                     content: contentTextField.text ?? "",
                     isFavorite: favoriteSwitch.isOn)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardComponent.pinToBounds(of: componentContainerView)
        cardComponent.render(.loading(loadingSwitch.isOn))
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false, block: { _ in
            self.loadingSwitch.isOn = false
            self.cardComponent.render(.loading(self.loadingSwitch.isOn))
            self.cardComponent.render(.build(self.componentDTO))
        })
    }
    
    @IBAction private func didTapRender() {
        cardComponent.render(.build(componentDTO))
    }
    
    @IBAction private func didSwitchFavorite() {
        cardComponent.render(.favorite(favoriteSwitch.isOn))
    }
    
    @IBAction private func didSwitchLoading() {
        cardComponent.render(.loading(loadingSwitch.isOn))
    }
}

extension ViewController: CardComponentDelegate {
    
    func cardComponentDidTapFavoriteButton(_ component: CardComponent) {
        favoriteSwitch.isOn = !favoriteSwitch.isOn
        component.render(.favorite(favoriteSwitch.isOn))
    }
}
