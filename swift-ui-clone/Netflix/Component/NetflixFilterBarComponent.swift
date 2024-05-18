//
//  NetflixFilterBarComponent.swift
//  swift-ui-clone
//
//  Created by Priyam Soni on 18/05/24.
//

import SwiftUI

struct FilterModel: Hashable, Equatable {
    let title: String
    let isDropdown: Bool
    
    static var mockArray: [FilterModel] {
        [
            FilterModel(title: "TV Shows", isDropdown: false),
            FilterModel(title: "Movies", isDropdown: false),
            FilterModel(title: "Categories", isDropdown: true),
        ]
    }
}

struct NetflixFilterBarComponent: View {
    
    var filters: [FilterModel] = FilterModel.mockArray
    var selectedFilter: FilterModel? = nil
    var onFilterPressed: ((FilterModel) -> Void)? = nil
    var onXmarkPressed: (() -> Void)? = nil
    
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                if selectedFilter != nil {
                    Image(systemName: "xmark")
                        .padding(8)
                        .background(
                            Circle()
                                .stroke(lineWidth: 1)
                        )
                        .foregroundStyle(.netflixLightGray)
                        .background(Color.black.opacity(0.0001))
                        .onTapGesture {
                            onXmarkPressed?()
                        }
                        .transition(AnyTransition.move(edge: .leading))
                        .padding(.leading, 16)
                }
                
                ForEach(filters, id: \.self){ filter in
                    if selectedFilter == nil || selectedFilter == filter {
                        NetflixFilterComponent(
                            title: filter.title,
                            isSelected: selectedFilter == filter,
                            isDropDown: filter.isDropdown
                        )
                        .background(Color.black.opacity(0.001))
                        .onTapGesture {
                            onFilterPressed?(filter)
                        }
                        .padding(.leading, ((selectedFilter == nil) && filter == filters.first) ? 16 : 0)
                    }
                }
            }
            .padding(.vertical, 4)
        }
        .scrollIndicators(.hidden)
        .animation(.bouncy, value: selectedFilter)
    }
}

fileprivate struct NetflixFilterBarViewPreview: View {
    
    @State private var filters = FilterModel.mockArray
    @State private var selectedFilter: FilterModel? = nil
    
    var body: some View {
        NetflixFilterBarComponent(
            filters: filters,
            selectedFilter: selectedFilter,
            onFilterPressed: { newFilter in
                selectedFilter = newFilter
            },
            onXmarkPressed: {
                selectedFilter = nil
            }
        )
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        NetflixFilterBarViewPreview()
    }
}
