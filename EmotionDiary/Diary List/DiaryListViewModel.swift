//
//  DiaryListViewModel.swift
//  EmotionDiary
//
//  Created by ByeongGuk Choi on 2024/02/13.
//

import Foundation
import Combine

final class DiaryListViewModel:ObservableObject {
    
    let storage: MoodDiaryStorage
    @Published var list: [MoodDiary] = []
    @Published var dic: [String: [MoodDiary]] = [:]
    
    var subscriptions = Set<AnyCancellable>()
    
    init(storage: MoodDiaryStorage) {
        self.storage = storage
        bind()
    }
    
    var keys: [String] {
        return dic.keys.sorted { $0 < $1 } //오름차순으로 정렬 -> 출력: 2022-04, 2022-05 ...
//        return dic.keys.sorted(by: <) //이렇게도 가능
    }
    
    private func bind() {
        $list.sink{ items in
            print("list changed ---> \(items)")
            self.dic = Dictionary(grouping: items, by: { $0.monthlyIdentifier }) //다이어리의 list가 추가,삭제,수정으로 변화가 생기면 그 값을 dic에 할당
            self.persist(items: items) //storage에 저장
        }.store(in: &subscriptions)
    }
    
    func persist(items: [MoodDiary]) {
        guard items.isEmpty == false else { return } //guard로 값이 비었으면 메소드가 종료됨
        self.storage.persist(items)
    }
    
    func fetch() {
        self.list = storage.fetch()
    }
}
