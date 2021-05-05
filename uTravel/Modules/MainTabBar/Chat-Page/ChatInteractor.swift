//
//  ChatInteractor.swift
//  uTravel
//
//  Created by Dmitry on 03.05.2021.
//  
//

import Foundation

final class ChatInteractor {
	weak var output: ChatInteractorOutput?
}

extension ChatInteractor: ChatInteractorInput {
}
