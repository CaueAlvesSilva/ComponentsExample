//
//  ComponentType.swift
//  AppComponents
//
//  Created by Cauê Alves on 22/09/19.
//  Copyright © 2019 ComponentsExample. All rights reserved.
//

/// Esse é o protocol que define o comportamento e dados necessários para a renderização e utilização de um Component.
public protocol ComponentType: class {
    
    /// Todo Component deve ter definido um tipo Delegate, que é um protocol para expor suas interações (taps, scroll, etc.).
    associatedtype Delegate
    
    /// Variável opcional do tipo Delegate que expoe as interações (taps, scroll, etc.).
    var delegate: Delegate? { get set }
    
    /// Todo Component deve ter um tipo DTO (Data Transfer Object) que contém os valores necessários para configurar e renderizar a interface.
    associatedtype DTO
    
    /// Todo Component deve ter definido um tipo RenderType que representa um ou múltiplos estados de renderização para diferentes variações de inteface (como set de valores, animações, alterações de constraints, etc.).
    associatedtype RenderType
    
    /// Esse é o único método para renderização da inteface do Component, e o paramêtro type define qual estado/variação será usada.
    func render(_ type: RenderType)
}
