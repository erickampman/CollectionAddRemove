//
//  CollectionManager.swift
//  CollectionAddRemove
//
//  Created by Eric Kampman on 10/9/24.
//

import SwiftUI

@Observable
final class Item: Identifiable, Equatable, Hashable {
	
	var title: String
	var instance: Int64
	
	var id: String {
		"\(title)_\(instance)"
	}

	init(id: String) {
		let components = id.split(separator: "_")
		guard components.count == 2 else {
			fatalError("Invalid id: \(id)")
		}
		
		self.title = String(components[0])
		self.instance = Int64(components[1]) ?? 0
	}
		
	init(title: String, instance: Int64) {
		self.title = title
		self.instance = instance
	}
	
	static func == (lhs: Item, rhs: Item) -> Bool {
		lhs.id == rhs.id
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(title)
		hasher.combine(instance)
	}
	
	static var sampleItems: [Item] {
		[
			.init(title: "One", instance: 1),
			.init(title: "Two", instance: 2),
			.init(title: "Three", instance: 3),
		]
	}
}

@Observable
class CollectionManager {
	var items: [Item] = Item.sampleItems
	
	func itemFromID(_ id: String) -> Item? {
		items.first(where: { $0.id == id })
	}
	
	func appendForID(_ id: String) {
		items.append(Item(id: id))
	}
	
	func append(_ item: Item) {
		items.append(item)
	}
	
	func removeForID(_ id: String) {
		items.removeAll(where: { $0.id == id })
	}
	
	func remove(_ item: Item) {
		if let index = items.firstIndex(of: item) {
			items.remove(at: index)
		}
	}
	
	func remove(at index: Int) {
		items.remove(at: index)
	}
	
	func indexForID(_ id: String) -> Int? {
		items.firstIndex(of: Item(id: id))
	}
	
	func isDuplicate(title: String, instance: Int64) -> Bool {
		let match = items.first { item in
			item.title == title && item.instance == instance
		}
		
		return match != nil
	}
	
}
