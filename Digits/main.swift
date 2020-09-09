//
//  main.swift
//  Digits
//
//  Created by Dmytro Davydenko on 08.09.2020.
//  Copyright © 2020 Dmytro Davydenko. All rights reserved.
//

import Foundation

func check(_ i: Int) -> Bool {
	
	let splitted = split(i)
	let digitsCount = countOfDigits(splitted)
	//	print("\(splitted)")
	//	print("\(digitsCount)")
	
	var idx = 0
	while idx < splitted.count {
		let neededCount = splitted[idx]
		let actualCount = digitsCount[idx]
		
		if neededCount != actualCount {
			break
		}
		
		idx += 1
	}
	
	return idx == splitted.count
}

func split(_ i:Int) -> [Int] {
	var digits = [Int]()
	
	var quotient = i
	while quotient > 0 {
		let (q, r) = quotient.quotientAndRemainder(dividingBy: 10)
		digits.append(r)
		quotient = q
	}
	
	return digits.reversed()
}

func countOfDigits(_ digits: [Int]) -> [Int] {
	var count = [Int](repeating: 0, count: 10)
	
	for digit in digits {
		count[digit] += 1
	}
	
	return count
}

for i in 0...999999999 {
	if check(i) {
		print("\(i)")
	}
}

//check(203055)

