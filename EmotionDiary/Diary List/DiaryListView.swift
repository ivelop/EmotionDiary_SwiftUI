//
//  ContentView.swift
//  EmotionDiary
//
//  Created by joonwon lee on 2022/07/02.
//

import SwiftUI

struct DiaryListView: View {
    @StateObject var vm: DiaryListViewModel
    @State var isPresenting: Bool = false
    //https://huniroom.tistory.com/entry/SwiftUI-state-property
    
    let layout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: layout) {
                        ForEach(vm.keys, id: \.self) { key in
                            Section {
                                let items = vm.dic[key] ?? []
                                let orderedItems = items.sorted(by: { $0.date < $1.date })
                                
                                ForEach(orderedItems) { item in
                                    NavigationLink {
                                        let vm = DiaryDetailsViewModel(diaries: $vm.list, diary: item)
                                        DiaryDetailsView(vm: vm)
                                    } label: {
                                        MoodDiaryCell(diary: item)
                                            .frame(height: 50)
                                    }
                                }
                            } header: {
                                Text(formattedSectionTitle(key))
                                    .font(.system(size: 30, weight: .black, design: .default))
                            }
                            .frame(height: 60)
                            .padding()
                        }
                    }
                }
                HStack {
                    Button {
                        print("New Button Tapped")
                        isPresenting = true
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                    }
                    .frame(width: 80, height: 80)
                    .foregroundColor(.white)
                    .background(Color.pink)
                    .cornerRadius(40)
                    
                }
            }
            .navigationTitle("Emotion Diary")
        }
        .sheet(isPresented: $isPresenting) {
            let vm = DiaryViewModel(isPresented: $isPresenting, diaries: $vm.list)
            //@Binding 구조체를 사용해 자식이 값을 변경하면 부모의 값도 변경되도록함, 부모가 자식에게 값을 '$'로 넘겨줘야함
            DiaryDateInputView(vm: vm) 
//            DiaryDateInputView(isPresented: $isPresenting)
        }
        .onAppear {
            vm.fetch()
        }
    }
}

extension DiaryListView {
    private func formattedSectionTitle(_ id: String) -> String {
        let dateComponents = id
            .components(separatedBy: "-")
            .compactMap { Int($0) }
        guard let year = dateComponents.first, let month = dateComponents.last else {
            return id
        }
        
        let calendar = Calendar(identifier: .gregorian)
        let dateComponent = DateComponents(calendar: calendar, year: year, month: month)
        let date = dateComponent.date!
        print(date)

        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        formatter.locale = Locale(identifier: "ko_kr")
        return formatter.string(from: date)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryListView(vm: DiaryListViewModel(storage: MoodDiaryStorage()))
    }
}
