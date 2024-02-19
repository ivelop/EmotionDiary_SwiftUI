//
//  DiaryViewModel.swift
//  EmotionDiary
//
//  Created by ByeongGuk Choi on 2024/02/19.
//

import Foundation
import SwiftUI
import Combine

final class DiaryViewModel: ObservableObject {
    @Published var date: Date = Date()
    @Published var isPresented: Binding<Bool>
    
    var subscriptions = Set<AnyCancellable>()
    
    init(isPresented: Binding<Bool>) {
        self.isPresented = isPresented
        
        $date.sink{ print($0) }.store(in: &subscriptions)
    }
}
