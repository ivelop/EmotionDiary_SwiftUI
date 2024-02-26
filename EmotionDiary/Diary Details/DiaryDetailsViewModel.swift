//
//  DiaryDetailsViewModel.swift
//  EmotionDiary
//
//  Created by ByeongGuk Choi on 2024/02/27.
//

import Foundation
import SwiftUI
import Combine

final class DiaryDetailsViewModel:ObservableObject {
    @Published var diaries: Binding<[MoodDiary]>
    @Published var diary: MoodDiary
    
    init(diaries: Binding<[MoodDiary]>, diary: MoodDiary) {
        self.diaries = diaries
        self.diary = diary
    }
    
    func delete() {
        //방법1 - 삭제할 값을 제외한 나머지 값만 재할당
//        diaries.wrappedValue = diaries.wrappedValue.filter { $0.id != diary.id } //diaries에서 diary와 id값이 다른 값만 찾아서 diaries에 재할당
        
        //방법2 - 인덱스를 사용해 특정값만 삭제
        let item = diaries.wrappedValue.indices.filter { diaries.wrappedValue[$0].id == diary.id } //diary의 인덱스 값 추출
        diaries.wrappedValue.remove(at: item.first!)
    }
}
