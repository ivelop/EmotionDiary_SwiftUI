//
//  DiaryDetailsView.swift
//  EmotionDiary
//
//  Created by joonwon lee on 2022/07/02.
//

import SwiftUI

struct DiaryDetailsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var diary: MoodDiary
    
    var body: some View {
        VStack{
            ScrollView {
                VStack(spacing: 50) {
                    Text(formattedDate(dateString: diary.date))
                        .font(.system(size: 30, weight: .bold))
                    Image(systemName: diary.mood.imageName)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 0)
                        .frame(height: 100)
                    Text(diary.text.description)
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(colorScheme == .dark ? .white:.black)
                    }
                }
            Spacer()
            
            HStack {
                Button {
                    print("Delete button tapped")
                } label: {
                    Image(systemName: "trash")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20)
                }
                .foregroundColor(colorScheme == .dark ? .white:.black)
                .padding()
                Spacer()
            }
        }
    }
}

extension DiaryDetailsView {
    private func formattedDate(dateString: String) -> String {
        let formatter = DateFormatter() //인스턴스 생성
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss" //받아오는 date의 형태
        
        let date = formatter.date(from: dateString) //date받아옴
//        formatter.locale = Locale(identifier: "ko-kr")
        
        formatter.dateFormat = "EEE, MMM d, yyyy" //받아온 date 형식 변환
        return formatter.string(from: date!)
        
    }
}

struct DiaryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryDetailsView(diary: MoodDiary.list.first!)
    }
}
