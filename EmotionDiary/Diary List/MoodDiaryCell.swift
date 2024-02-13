//
//  MoodDiaryCell.swift
//  EmotionDiary
//
//  Created by ByeongGuk Choi on 2024/02/13.
//

import SwiftUI

struct MoodDiaryCell: View {
    
    var diary: MoodDiary
    
    var body: some View {
        Image(systemName: diary.mood.imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .shadow(color: .black.opacity(0.2), radius: 10, x: 10, y: 0)
    }
}

struct MoodDiaryCell_Previews: PreviewProvider {
    static var previews: some View {
        MoodDiaryCell(diary: MoodDiary.list[0])
    }
}
