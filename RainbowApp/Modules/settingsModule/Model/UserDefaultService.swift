//
//  UserDefaultService.swift
//

import Foundation

final class UserDefaultService {
    
    static let shared = UserDefaultService()
    private let defaults = UserDefaults.standard
    
    private init() {}
    
    // Сохраняем любое Codable
    func saveData<T: Codable>(type: T, forKey key: String) {
        if let encoded = try? JSONEncoder().encode(type) {
            defaults.set(encoded, forKey: key)
        }
    }
    
    // Считываем любое Codable
    func getData<T: Codable>(forKey key: String) -> T? {
        if let saveData = defaults.data(forKey: key) {
            if let decoded = try? JSONDecoder().decode(T.self, from: saveData) {
                return decoded
            }
        }
        return nil
    }
    
    func removeData(forKey key: String) {
        defaults.removeObject(forKey: key)
    }
}
