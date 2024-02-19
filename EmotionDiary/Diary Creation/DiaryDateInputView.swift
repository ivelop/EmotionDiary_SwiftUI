//
//  DiaryDateInputView.swift
//  EmotionDiary
//
//  Created by joonwon lee on 2022/07/02.
//

import SwiftUI


struct DiaryDateInputView: View {
    
//    @State var date: Date = Date()
//    @Binding var isPresented: Bool
//
    @StateObject var vm: DiaryViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker(
                    "Start Date",
                    selection: $vm.date,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
                .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
                Spacer()
                
                NavigationLink { //NavigationLink는 NavigationView안에서 사용
                    DiaryMoodInputView()
                } label: {
                    Text("Next")
                        .frame(width: 200, height: 80)
                        .background(Color.pink)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                        .font(.system(size: 20, weight: .medium))
                }
                
                
                
            }
        }
    }
}

struct DiaryDateInputView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = DiaryViewModel(isPresented: .constant(true))
        DiaryDateInputView(vm: vm)
//        DiaryDateInputView(isPresented: .constant(false))
    }
}
