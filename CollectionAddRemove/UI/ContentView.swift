//
//  ContentView.swift
//  CollectionAddRemove
//
//  Created by Eric Kampman on 10/9/24.
//

import SwiftUI

struct ContentView: View {
	@State var collectionManager = CollectionManager()
	@State var showAddItem: Bool = false
	@State var showEditItem: Bool = false
	@State var showRemoveSure: Bool = false
	@State var selection = Item?.none
	
    var body: some View {
        VStack {
			HStack {
				Spacer()
				Button("Add Item") {
					showAddItem.toggle()
				}
				.buttonStyle(BorderedButtonStyle())
				Button("Edit Item") {
					showEditItem.toggle()
				}
				.disabled(selection == nil)
				.buttonStyle(BorderedButtonStyle())
				#if os(macOS)
				Button("Remove Item") {
					showRemoveSure.toggle()
				}
				.disabled(selection == nil)
				.buttonStyle(BorderedButtonStyle())
				#endif
				Spacer()
			}
			List(selection: $selection) {
				ForEach(collectionManager.items, id:\.self) { item in
					ItemView(item: item)
				}
				.onDelete(perform: delete)
			}
        }
        .padding()
		.sheet(isPresented: $showAddItem) {
			AddItemView(collectionManager: $collectionManager)
		}
		.sheet(isPresented: $showEditItem) {
			EditItemView(collectionManager: $collectionManager, item: selection!)
				.disabled(selection == nil)
		}
		.sheet(isPresented: $showRemoveSure) {
			RemoveSureView(item: $selection, collectionManager: collectionManager)
		}
    }
	
	func delete(offset: IndexSet) {
		let index = offset.first!
		collectionManager.remove(at: index)
	}
}

#Preview {
    ContentView()
}
