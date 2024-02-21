//
//  DiaryMoodInputView.swift
//  EmotionDiary
//
//  Created by joonwon lee on 2022/07/02.
//

import SwiftUI

struct DiaryMoodInputView: View {
    //감정 선택 -> 선택시 뷰 모델에 저장
    @ObservedObject var vm: DiaryViewModel
    //@ObservedObject를 사용하면 데이터가 변경되면 화면을 다시 그릴 수 있음,
    //@ObservedObject를 사용하려면 DiaryViewModel이 ObservableObject프로토콜을 따라야함
    
    let moods: [Mood] = Mood.allCases //Mood의 모든 케이스를 배열로 넣음,
    //case를 배열로 바꿔주는 타입 프로퍼티 allCases를 사용하려면 enum으로 선언된 것이 CaseIterable 프로토콜을 가져야함
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                ForEach(moods, id:\.self) { mood in
                    Button {
                        print("Mood Selected")
                        vm.mood = mood
                    } label: {
                        VStack {
                            Image(systemName: mood.imageName)
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 80)
                                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 0)
                                .padding()
                            Text(mood.name)
                                .foregroundColor(Color.gray)
                        }
                        .frame(height: 180)
                        .background(mood == vm.mood ? Color.gray.opacity(0.4) : Color.clear)
                        .cornerRadius(10)
                    }
                }
            }
            .padding()
            
            Spacer()
            
            NavigationLink { //DiaryDateInputView에서 NavigationView 사용해서 NavigationView뷰 없이 사용가능?
                DiaryTextInputView(vm: self.vm)
            } label: {
                Text("Next")
                    .frame(width: 200, height: 80)
                    .foregroundColor(.white)
                    .background(Color.pink)
                    .cornerRadius(40)
            }
        }
    }
}

struct DiaryMoodInputView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = DiaryViewModel(isPresented: .constant(false))
        DiaryMoodInputView(vm: vm)
    }
}
