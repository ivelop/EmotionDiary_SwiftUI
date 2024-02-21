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
    @Published var text: String = ""
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
        }.store(in: &subscriptions)
        
        $text.sink {
            print("entered text ---> \($0)")
            self.update(text: $0)
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
    
    private func update(text: String) {
        self.diary.text = text
    }
    
    func completed() {
        guard diary.text.isEmpty == false else { return }
        
        print("전체 리스트 추가")
        isPresented.wrappedValue = false
    }
}
