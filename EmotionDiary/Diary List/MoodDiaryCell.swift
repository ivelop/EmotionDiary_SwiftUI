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
            .renderingMode(.original) //오리지널 컬러로
            .resizable() //크기를 조정하여 최대 크기로 키움
            .aspectRatio(contentMode: .fit) //비율을 조정하여 한쪽만 늘려지지 않도록
            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 0)
            //흰배경에서도 구름이 보이도록 그림자를 줌
    }
}

struct MoodDiaryCell_Previews: PreviewProvider {
    static var previews: some View {
        MoodDiaryCell(diary: MoodDiary.list[0])
    }
}
