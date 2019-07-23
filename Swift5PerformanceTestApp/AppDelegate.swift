//
//  AppDelegate.swift
//  Swift5PerformanceTestApp
//
//  Created by Daniel Alm on 23.07.19.
//  Copyright © 2019 Daniel Alm. All rights reserved.
//

import Cocoa
import SecondModule

public struct LocalKeyStruct: Hashable {
	@inlinable public static func == (lhs: LocalKeyStruct, rhs: LocalKeyStruct) -> Bool {
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

public class LocalKeyClass: Hashable {
	@inlinable public static func == (lhs: LocalKeyClass, rhs: LocalKeyClass) -> Bool {
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

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	@IBOutlet weak var window: NSWindow!


	func applicationDidFinishLaunching(_ aNotification: Notification) {
		print("Starting...")

		var start = CACurrentMediaTime()
		let range = 0..<200
		if true {
			var dict1: [LocalKeyStruct: Int] = [:]
			dict1.reserveCapacity(range.count * range.count * range.count)
			for a in range {
				for b in range {
					for c in range {
						dict1[.init(a: a, b: b, c: c)] = 0
					}
				}
			}

			for a in range {
				for b in range {
					for c in range {
						dict1[.init(a: a, b: b, c: c)] = 1
					}
				}
			}
		}
		print("Total time taken for \(range.count * range.count * range.count) elements, local struct: \(CACurrentMediaTime() - start) s.")

		start = CACurrentMediaTime()
		if true {
			var dict2: [LocalKeyClass: Int] = [:]
			dict2.reserveCapacity(range.count * range.count * range.count)
			for a in range {
				for b in range {
					for c in range {
						dict2[.init(a: a, b: b, c: c)] = 0
					}
				}
			}

			for a in range {
				for b in range {
					for c in range {
						dict2[.init(a: a, b: b, c: c)] = 1
					}
				}
			}
		}
		print("Total time taken for \(range.count * range.count * range.count) elements, local class: \(CACurrentMediaTime() - start) s.")


		start = CACurrentMediaTime()
		if true {
			var dict3: [SecondModuleKeyStruct: Int] = [:]
			dict3.reserveCapacity(range.count * range.count * range.count)
			for a in range {
				for b in range {
					for c in range {
						dict3[.init(a: a, b: b, c: c)] = 0
					}
				}
			}

			for a in range {
				for b in range {
					for c in range {
						dict3[.init(a: a, b: b, c: c)] = 1
					}
				}
			}
		}
		print("Total time taken for \(range.count * range.count * range.count) elements, remote struct: \(CACurrentMediaTime() - start) s.")

		start = CACurrentMediaTime()
		if true {
			var dict4: [SecondModuleKeyClass: Int] = [:]
			dict4.reserveCapacity(range.count * range.count * range.count)
			for a in range {
				for b in range {
					for c in range {
						dict4[.init(a: a, b: b, c: c)] = 0
					}
				}
			}
			
			for a in range {
				for b in range {
					for c in range {
						dict4[.init(a: a, b: b, c: c)] = 1
					}
				}
			}
		}
		print("Total time taken for \(range.count * range.count * range.count) elements, remote class: \(CACurrentMediaTime() - start) s.")

		exit(0)
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}


}

