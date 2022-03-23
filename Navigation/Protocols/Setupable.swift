//
//  Setupable.swift
//  Navigation
//
//  Created by Кирилл Демьянцев on 17.03.2022.
//

import Foundation

protocol ViewModelProtocol {}

protocol Setupable {
    func setup(with viewModel: ViewModelProtocol)
}
