//
//  DiaryListViewModel.swift
//  EmotionDiary
//
//  Created by ByeongGuk Choi on 2024/02/13.
//

import Foundation
import Combine

final class DiaryListViewModel:ObservableObject {
    @Published var list: [MoodDiary] = MoodDiary.list
    @Published var dic: [String: [MoodDiary]] = [:]
    
    init() {
        self.dic = Dictionary(grouping: self.list, by: { $0.monthlyIdentifier })
    }
    
    var keys: [String] {
        //sorted: 원복은 나두고 오름차순으로 정렬하여 새로운 값을 만듬
        return dic.keys.sorted { $0 < $1 }
    }
}
