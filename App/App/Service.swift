//
//  Service.swift
//  App
//
//  Created by Cauê Alves on 25/09/19.
//  Copyright © 2019 ComponentsExample. All rights reserved.
//

import Foundation

typealias Investment = (name: String, description: String)

class Service {
    
    static let investments: [Investment] = [
        ("Tesouro Direto", "Emitidos pelo Governo Federal, são indicados para quem busca rendimento superior à poupança, valor mínimo baixo de investimento e o menor risco do mercado."),
        ("Renda Fixa", "Investimentos para quem deseja possibilidades de retornos superiores aos títulos do Governo Federal, mas quer continuar a ter uma previsão sobre seus ganhos."),
        ("Fundos de Investimentos", "Indicado para quem deseja gestão especializada e diversidade em seus investimentos, reúne recursos de diferentes investidores em uma estratégia comum."),
        ("Renda Variável", "Composto por ações, opções, FIIs, ETFs e índices futuros, é indicado para investidores que suportam uma maior variação do seu patrimônio.")
    ]
}
