//
//  Key.swift
//  SecondModule
//
//  Created by Daniel Alm on 23.07.19.
//  Copyright © 2019 Daniel Alm. All rights reserved.
//

import Foundation

public struct SecondModuleKeyStruct: Hashable {
	@inlinable public static func == (lhs: SecondModuleKeyStruct, rhs: SecondModuleKeyStruct) -> Bool {
		return lhs.a == rhs.a && lhs.b == rhs.b && lhs.c == rhs.c
	}

	@inlinable public func hash(into hasher: inout Hasher) {
		hasher.combine(a)
		hasher.combine(b)
		hasher.combine(c)
	}

	public let a: Int
	public let b: Int
	public let c: Int

	public init(a: Int, b: Int, c: Int) {
		self.a = a
		self.b = b
		self.c = c
	}
}

public final class SecondModuleKeyClass: Hashable {
	@inlinable public static func == (lhs: SecondModuleKeyClass, rhs: SecondModuleKeyClass) -> Bool {
		return lhs.a == rhs.a && lhs.b == rhs.b && lhs.c == rhs.c
	}

	@inlinable public func hash(into hasher: inout Hasher) {
		hasher.combine(a)
		hasher.combine(b)
		hasher.combine(c)
	}

	public let a: Int
	public let b: Int
	public let c: Int

	public init(a: Int, b: Int, c: Int) {
		self.a = a
		self.b = b
		self.c = c
	}
}
