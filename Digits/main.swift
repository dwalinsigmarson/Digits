//
//  main.swift
//  Digits
//
//  Created by Dmytro Davydenko on 08.09.2020.
//  Copyright © 2020 Dmytro Davydenko. All rights reserved.
//

import Foundation

func check(_ i: Int) -> Bool {
	
	var splitted = [Int](repeating: 0, count: 10)
	var digitsOccurenceCount = [Int](repeating: 0, count: 10)
	
	let digitsCount = split(i, digits: &splitted)
	countOfDigits(splitted, count:digitsCount, occurenceCount: &digitsOccurenceCount)
	//	print("\(splitted)")
	//	print("\(digitsCount)")
	
	var idxSplitted = digitsCount - 1
	var idxOccurence = 0
	while idxSplitted >= 0 {
		let neededCount = splitted[idxSplitted]
		let actualCount = digitsOccurenceCount[idxOccurence]
		
		if neededCount != actualCount {
			break
		}
		
		idxSplitted -= 1
		idxOccurence += 1
	}
	
	return idxSplitted < 0
}

func split(_ num: Int, digits: inout [Int]) -> Int {
	var quotient = num
	var idx = 0
	
	while quotient > 0 {
		let (q, r) = quotient.quotientAndRemainder(dividingBy: 10)
		digits[idx] = r
		quotient = q
		idx += 1
	}
	
	return idx
}

func countOfDigits(_ digits: [Int], count: Int, occurenceCount: inout [Int]) {
	var idx = 0
	while idx < count {
		let digit = digits[idx]
		occurenceCount[digit] += 1
		idx += 1
	}
}

for i in 0...999999999 {
	if check(i) {
		print("\(i)")
	}
}

//let res = check(821000001000)

//0
//1210
//2020
//21200
//3211000
//42101000
//521001000
//6210001000
//72100001000
//821000001000

