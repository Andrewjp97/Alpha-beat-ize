//
//  Model.swift
//  Alpha-beat-ize
//
//  Created by Andrew Paterson on 7/30/24.
//

import Foundation

enum Alphabet: String, CaseIterable{
  case a = "a"
  case b = "b"
  case c = "c"
  case d = "d"
  case e = "e"
  case f = "f"
  case g = "g"
  case h = "h"
  case i = "i"
  case j = "j"
  case k = "k"
  case l = "l"
  case m = "m"
  case n = "n"
  case o = "o"
  case p = "p"
  case q = "q"
  case r = "r"
  case s = "s"
  case t = "t"
  case u = "u"
  case v = "v"
  case w = "w"
  case x = "x"
  case y = "y"
  case z = "z"
}

struct ItemDictionary: Codable {
  let a: [String]
  let b: [String]
  let c: [String]
  let d: [String]
  let e: [String]
  let f: [String]
  let g: [String]
  let h: [String]
  let i: [String]
  let j: [String]
  let k: [String]
  let l: [String]
  let m: [String]
  let n: [String]
  let o: [String]
  let p: [String]
  let q: [String]
  let r: [String]
  let s: [String]
  let t: [String]
  let u: [String]
  let v: [String]
  let w: [String]
  let x: [String]
  let y: [String]
  let z: [String]
  
  var allItems: [String] {
    return a + b + c + d + e + f + g + h + i + j + k + l + m + n + o + p + q + r + s + t + u + v + w + x + y + z
  }
  
}

struct GameState {
  
  var currentLetter: Alphabet
  var letterDictionary: ItemDictionary
  var currentPossibleAnswers: [String] {
    switch currentLetter {
    case .a:
      return letterDictionary.a
    case .b:
      return letterDictionary.b
    case .c:
      return letterDictionary.c
    case .d:
      return letterDictionary.d
    case .e:
      return letterDictionary.e
    case .f:
      return letterDictionary.f
    case .g:
      return letterDictionary.g
    case .h:
      return letterDictionary.h
    case .i:
      return letterDictionary.i
    case .j:
      return letterDictionary.j
    case .k:
      return letterDictionary.k
    case .l:
      return letterDictionary.l
    case .m:
      return letterDictionary.m
    case .n:
      return letterDictionary.n
    case .o:
      return letterDictionary.o
    case .p:
      return letterDictionary.p
    case .q:
      return letterDictionary.q
    case .r:
      return letterDictionary.r
    case .s:
      return letterDictionary.s
    case .t:
      return letterDictionary.t
    case .u:
      return letterDictionary.u
    case .v:
      return letterDictionary.v
    case .w:
      return letterDictionary.w
    case .x:
      return letterDictionary.x
    case .y:
      return letterDictionary.y
    case .z:
      return letterDictionary.z
    }
  }
  
  var gameComplete: Bool = false
  
  func checkAnswer(answer: String) -> Bool {
    return currentPossibleAnswers.contains(answer)
  }
  
  mutating func advance() -> Void {
    switch currentLetter {
    case .a:
      currentLetter = .b
    case .b:
      currentLetter = .c
    case .c:
      currentLetter = .d
    case .d:
      currentLetter = .e
    case .e:
      currentLetter = .f
    case .f:
      currentLetter = .g
    case .g:
      currentLetter = .h
    case .h:
      currentLetter = .i
    case .i:
      currentLetter = .j
    case .j:
      currentLetter = .k
    case .k:
      currentLetter = .l
    case .l:
      currentLetter = .m
    case .m:
      currentLetter = .n
    case .n:
      currentLetter = .o
    case .o:
      currentLetter = .p
    case .p:
      currentLetter = .q
    case .q:
      currentLetter = .r
    case .r:
      currentLetter = .s
    case .s:
      currentLetter = .t
    case .t:
      currentLetter = .u
    case .u:
      currentLetter = .v
    case .v:
      currentLetter = .w
    case .w:
      currentLetter = .x
    case .x:
      currentLetter = .y
    case .y:
      currentLetter = .z
    case .z:
      currentLetter = .a
      gameComplete = true
    }
  }
  
}
