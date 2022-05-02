//
//  Setupable.swift
//  Navigation
//
//  Created by Кирилл Демьянцев on 17.03.2022.
//


import UIKit

protocol ViewModelProtocol {}

protocol Setupable {
    func setup(with viewModel: ViewModelProtocol)
}

