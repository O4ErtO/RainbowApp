//
//  Array + ext.swift
//

import Foundation

extension Array where Element: Equatable {
    func whereElements(_ value: Element) -> [Int] {
        return self.indices.filter { self[$0] == value }
    }
}

extension RandomAccessCollection {
    func elements(at indices: [Index]) -> [Element] { indices.map { self[$0] } }
}

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
