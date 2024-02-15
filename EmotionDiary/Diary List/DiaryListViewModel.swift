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
        return dic.keys.sorted { $0 < $1 } //오름차순으로 정렬 -> 출력: 2022-04, 2022-05 ...
//        return dic.keys.sorted(by: <) //이렇게도 가능
    }
}
