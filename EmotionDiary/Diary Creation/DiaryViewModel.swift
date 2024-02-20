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
    @Published var diary: MoodDiary = MoodDiary(date: "", text: "", mood: .great)
    
    @Published var date: Date = Date()
    @Published var mood: Mood = .great
    @Published var isPresented: Binding<Bool>
    
    var subscriptions = Set<AnyCancellable>()
    
    init(isPresented: Binding<Bool>) {
        self.isPresented = isPresented
        
        $date.sink{
            print("selected date ---> \($0)")
            self.update(date: $0)
//            self.diary.date = "\($0)"
        }.store(in: &subscriptions)
        
        $mood.sink {
            print("selected mood ---> \($0)")
            self.update(mood: $0)
//            self.diary.mood = $0
        }.store(in: &subscriptions)
    }
    
    private func update(date: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let formatDate = formatter.string(from: date)
        self.diary.date = "\(formatDate)"
    }
    
    private func update(mood: Mood) {
        self.diary.mood = mood
    }
}
