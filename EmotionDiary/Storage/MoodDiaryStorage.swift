//
//  MoodDiaryStorage.swift
//  TextfieldTest
//
//  Created by joonwon lee on 2022/07/01.
//

import Foundation

final class MoodDiaryStorage {
    
    func persist(_ items: [MoodDiary]) { //스토리지에 저장
        Storage.store(items, to: .documents, as: "diary_list.json")
    }
    
    func fetch() -> [MoodDiary] { //스토리지를 불러옴
        let list = Storage.retrive("diary_list.json", from: .documents, as: [MoodDiary].self) ?? []
        return list
    }
}
