//
//  Singleton.swift
//  City-Search
//
//  Created by tair on 28.03.22.
//

import Foundation

@propertyWrapper
struct Singleton<Value> {
    private var maker: () -> Value
    private var _value: Value?

    init(wrappedValue: @autoclosure @escaping () -> Value) {
        maker = wrappedValue
    }

    var wrappedValue: Value {
        mutating get {
            if let existing = _value { return existing }
            let newValue = maker()
            _value = newValue
            return newValue
        }
    }
    mutating func reset() {
        _value = nil
    }
}
