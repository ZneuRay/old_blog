---
layout: post
title: "swift-enumerations"
date: 2016-01-10 18:02:10 +0800
date_formatted: 18:02 Jan 10, 2016
comments: true
published: false
categories: [Swift]
keywords: Swift, iOS developer, Ruby, Ruby On Rails, programming, coding, Octopress, 用嘴寫code
description: Swift Enumerations 列舉
---

Swift基礎 Enumerations(列舉)
===

`Enumeration`是一種用來定義一組通用型相依值的型態，所定義的成員可以是任意型態，包含字串、字元、整數等，並且可以不需要初始值，而在Swift中又提供了更彈性、更安全的方法來使用這組值。

<!-- more -->

要定義一個列舉必須使用`enum`來定義，以下定義一個動物的列舉，成員包含`Cat`、`Dog`、`Bird`這三種動物，使用`case`來定義列舉的成員

```swift
enum Animal {
	case Cat
	case Dog
	case Bird
}
// 或
enum Animal {
	case Cat, Dog, Bird
}

print(Animal.Cat) // Cat
```
>Swift的列舉成員並非像其它語言一樣從0開始，是說在沒有指定列舉型態時，`Animal.Cat`並不會有值存在，也不會等於0，實際印出`Animal.Cat`會顯示成員名稱`Cat`，但這是成員名稱，並不是`raw value`(原始值)，下面會再講解
>

以上兩種方式都可以達到相同的效果，列舉已經定義好了，就來取得列舉中成員

```swift
var pet = Animal.Cat
```

如果一個變數的型態已經被初始化過了，那還可以用簡化的方式取得列舉成員

```swift
// 因為pet在上面給予值時已初始化過，給予新成員時可以簡寫成
pet = .Dog

var myPet: Animal
myPet = .Cat
 
```

再來使用Switch來判斷選擇的列舉成員是哪項

```swift
switch pet {
	case .Cat:
		print("貓咪")
	case .Dog:
		print("狗")
	case .Bird:
		print("鳥")
}
// 結果會印出 "狗"
```

> 在Swift中switch會去嚴格的檢查列舉的所有成員是否有全部加入判斷，例如存在`Animal.Bird`成員，如果switch少了`case .Bird:`判斷式就會報錯，但如果有加上`default:`的話表示除了`case:`以外的所有成員，這樣就不會有問題，這點是跟其他程式語言較不一樣的地方
>

### Associated values 關聯值

列舉成員的型態可以是`Associated values`，這可以讓列舉成員是一個關聯的型態，而非一個實際值的常數，使的這個成員可以在執行時才根據傳入的關聯來決定值，使得每次得到的結果都可以不相同，這讓列舉可以儲存更多額外的資訊，增加了許多彈性，我們來定義一個列舉叫Form，擁有正方型跟三角型兩個成員

```swift
enum Form {

}
```

### raw values 原始值

```swift
enum Number: Int {
	case one = 1
	case two = 2
	case three = 3
}

print(Number.one) // one
print(Number.one.rawValue) // 1
```

列舉中要初始化成員需要先指定列舉的型態，這邊指定為Int，因此我們給予每個成員Int型態的初始值，這就成為該成員的原始值，此時取原始值需要用`rawValue`來取得原始值，在最一開始定義的Animal列舉成員並沒有給予原始值，這時如果使用`rawValue`則會報錯

當列舉已經指定型態後，可以省略給予成員初始值，Swift會自動給予對應的值

```swift
enum Number: Int {
	case zero, one, two, three
}
print(Number.two.rawValue) // 2

enum Alphabet: String {
	case a, b, c
}
print(Alphabet.b.rawValue) // b
```

當列舉有原始值時也可以透過原始值來取得成員，因為不能保證原始值有存在，所以回傳的成員會是Optional

```swift
let numberOne = Number(rawValue: 1)
print(numberOne!) // one
```

### Recursive enumerations 遞迴列舉

這算是`Associated values`的進階版，讓列舉關聯到自已而產生遞迴，

```swift
enum ArithmeticExpression {
    case Number(Int)
    indirect case Addition(ArithmeticExpression, ArithmeticExpression)
    indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
}
```

> 摘錄自: Apple Inc. 「The Swift Programming Language (Swift 2.1)。」 iBooks. https://itunes.apple.com/tw/book/swift-programming-language/id881256329?l=zh&mt=11
> 

因為要傳入的型態是自己(ArithmeticExpression)，所以這裡加上`indirect`關鍵字，表示這是一個遞迴列舉，
也可以寫在enum前簡化

```swift
indirect enum ArithmeticExpression {
    case Number(Int)
    case Addition(ArithmeticExpression, ArithmeticExpression)
    case Multiplication(ArithmeticExpression, ArithmeticExpression)
}
```

```swift
func evaluate(expression: ArithmeticExpression) -> Int {
    switch expression {
    case .Number(let value):
        return value
    case .Addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .Multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}
 
// evaluate (5 + 4) * 2
let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addition(five, four)
let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(2))
print(evaluate(product))
// prints "18"
```