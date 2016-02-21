---
layout: post
title: "Swift學習 - 基礎篇"
date: 2016-01-25 01:36:02 +0800
date_formatted: 01:36 Jan 25, 2016
comments: true
categories: 
keywords: Swift, "常數", "變數", iOS developer, Ruby, Ruby On Rails, programming, coding, Octopress, 用嘴寫code
description: 一個記錄Swift學習過程的網站
---

Swift是一個安全型別(type-safe)的語言，意思是說Swift會幫助你判別值的型別是什麼，例如說目前值所屬的型別是`String`，那麼Swift就會預防你不小心給予它`Int`的值，這可以幫助你在開發的過程中即時發現錯誤並修正。

### 常數(Constants)與變數(Variables)

在程式中我們常常會需要記錄一些內容，例如一組字串(String)**`"Hello"`**或一個整數(Int)**`10`**，這些內容稱為值(value)，而我們會使用一組名稱來記錄這些值，稱為`常數`或`變數`，常數與變數的差別在於常數在第一次給予值後就無法再變更他的值了，而變數則可任意變更。

<!-- more -->

### 宣告常數與變數

所有的常數與變數在使用前都必須先宣告，讓程式知道你將要使用這個變數，常數使用`let`，變數使用`var`來宣告，而宣告的常數或變數名稱盡量要好讀為主，避免忘了自已當時到底想描述什麼，以下示範一個追縱登入次數限制的範例 :

```swift
let pi = 3.14159
var radius = 5
```

這裡宣告一個常數`pi`，也就是圓周率`π`，與一個變數`radius`，因為圓周率的值是不會改變的，所以很適合宣告為常數，同時也可以避免不小心修改到`pi`的值造成計算的結果不正確

```swift
pi = 2.5 //這行會編譯錯誤
radius = 10
```

在宣告多個常數或變數時也可以簡寫在一行，只要使用`,`分隔即可

```swift
var x = 0.0, y = 1.0, z = 2.0
```

### 型別標注(Type Annotation)


儲存的值會有各種不同的型別存在，為了清楚的說明該常數或變數可儲存的值是什麼型別，我們可以加上型別標注，以下我們宣告一個儲存字串的變數，為給予一組字串

```swift
var welcomeMessage: String
welcomeMessage = "Hello"
```

宣告相同型別時也可簡寫在一行

```swift
var red, green, blue: Double
```

Swift有強力的型別推斷，在宣告時有給予初始值時Swift就可以自動推斷型別，因此可以省略型別標注

```swift
let dog = "狗"
//或
let cat: String = "貓"
//都是宣告一組字串常數

let bird //這行會編釋錯誤
```

### 註解(Comments)

註解是用在幫程式碼加上備註，讓程式碼更容易讀懂，也能幫助你未來再回來看程式碼時可透過註解馬上理解當初寫這些程式的用途是什麼，註解有兩種方式，分別是單行註解`//`與區塊註解`/* */`

```swift
// this is a comment

/* this is also a comment,
but written over multiple lines */

/* this is the start of the first multiline comment
/* this is the second, nested multiline comment */
this is the end of the first multiline comment */
```

Swift的註解支援巢狀(nested)註解，這在做些測試的時後非常好用，目前多數常見的語言都不支援，算是比較特別的地方

### 常數與變數命名方式

常數與變數的命名方式主要是英文為主，大小寫皆可，雖然也支援unicode，但不太建議使用，因為這反而會讓你的程式碼更難維護

```swift
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
```

命名常數與變數時不可包含空白、特殊符號等，命名可包含數字，但數字不可以在字首

```swift
// 錯誤的命名方式
let ↓ = "down arrow" // 特殊符號
let 1string = "one" // 數字不可在字首
let say hello = "hello" // 不可有空白
let String = "a string" // String是保留字

// 正確的命名方式
let string_1 = "string one"
let thisIsAPen = "這是一隻筆"
```

另外還有保留字，也就是Swift的語法會中使用到的字，例如`Int`、`if`、`class`等，雖然只要在前後加上`` `可以用來命名，但可能會造成混亂，應盡量避免使用

```swift
var `class` = "Hello"
`class` = "Hi"
```

class為類別的型別標注，在這裡使用class來命名雖然可行，但後面在撰寫程式時可能造成搞不清楚這是變數還是類別，容易造成混亂

### 印出常數與變數

以上我們宣告了一堆常數與變數，接下來就要把裡面的值印出來看看，這裡使用print()就可以把值印在xcode的console上，print()的完整定義是`print(_:separator:terminator:)`，這表示print()這個涵式(function)可以傳入3個參數，在後面的章節會再詳細介紹，現在我們先來把值印出看看

```swift
print(welcomeMessage)
print("welcomeMessage Ray")
print("\(welcomeMessage) Ray")
```

單純只要印出變數或常數的話直接放入print()中就可以，要印出字串也可直接將字串放入，如果要在字串中使用常數或變數則需要使用`\(常數或變數)`，Swift在字串中遇到這種格式就會自動以正確的值來替換

### 分號(Semicolons)

在大部份程式語言中都會要求程式的每段陳述(statment)都要以`;`結尾，在Swift中則不需要，不過加上也不影響，但如果想要在一行中寫出超過一段的陳述就需要加上`;`

```swift
let apple = "蘋果"; print(apple)
```

### 整數(Integers)

整數有有號(signed)與無號(unsigned)，有號整數包含正負數與0，無號整數只有正數與0，宣告有號整數使用`Int`，無號整數使用`UInt`，另外Swift也提供8、16、32和64 bits的整數型別，分別在`Int`後方加上對應的bit數即可，如`Int8`，無號的如`UInt16`

```swift
print(Int8.min)
print(Int8.max)
print(UInt8.min)
print(UInt8.max) 
//let cannotBeNegative: UInt8 = -1
//let tooBig: Int8 = 256
print(Int16(1234))
```

一般來說使用`Int`就足夠了，Swift會自動依目前裝置支援32或64-bit自動調整，32-bit的整數範圍為 -2,147,483,648 與 2,147,483,647，已經足夠應付大部份的程式

### 浮點數(Floating Point)

浮點數指的是包含小數點的數，如`3.14159`，浮點數則提供了32與64 bits的型別，分別為`Float`與`Double`，精準度則為6位與15位的小數，在沒有特殊情況的考量下一般建議使用`Double`即可，Swift的型別推斷也是以`Double`為主，下面我們印出前面已宣告常數pi的型別，可知道Swift自動推斷型別為`Double`

```swift
print(pi.dynamicType) // Double
```

### 布林值(Booleans)

布林值是一種用於邏輯判斷的值，僅能儲存`true`與`false`，要宣告一個布林值使用`Bool`

```swift
let myNameIsRay: Bool = true
let theLanguageIsRuby: Bool = false
```

由於swift的型別安全機制，swift的布林值與大多數語言不同，`true`的值並非等於`1`，`false`也不等於`0`，這在使用條件判斷式如`if`時要特別注意，避免出錯

### 數值字面(Numeric Literals)

整數中有2、8、10和16進位數值，一般我們常使用的是10進位，在Swift中可以使用前綴字的方式表示不同進位數值 : 

* 10進位(Decimal) : 無
* 2進位(Binary) : 0b
* 8進位(Octal) : 0o
* 16進位(Hexadecimal) : 0x

以下4行程式碼以不同的進位方式表示數字`12`

```swift
let decimalInteger = 12
let binaryInteger = 0b1100
let octalInteger = 0o14
let hexadecimalInteger = 0xA
```

浮點數中並沒有2與8進位的表示方式，但指數(exponent)部份是屬於浮點數，加上數值字面來表示

* 10進位字面為`e`，表示基數乘與10的`e`次方
	* 1.25e2 = 1.25 x 10^2 = 125.0
	* 1.25e-2 = 1.25 x 10^-2 = 0.0125
* 16進位字面為`p`，表示基數乘與2的`p`次方
	* 0xFp2 = 15 x 2^2 = 60.0
	* 0xFp-2 = 15 x 2^2 = 3.75

以下3行同樣表示12.1875

```swift
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0
```

數值字面還可以包含額外的`0`與`_`讓數字更容易讀

```swift
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1
```

### 字串(String)

字串就是一串文字，必須需用雙引號`"`包起來

```swift
let myName = "Ray"
```

### 空值(nil)

在一般的程式語言中，`nil`(有些語言使用`null`)表示一個常數或變數為空的值，而讀取一個為nil的常數或變數就會造成程式錯誤(但可以用條件來判斷是否為nil)，因為不存在任何值，在Swift中因為有安全性的機制，並無法像一般語言直接將nil給予常數或變數，需要搭配Optional使用，這也幫助了開發者減少一些不可預期的錯誤

### 型別別名(Type Alias)

使用關鍵字`typealias`可以幫型別取別名來代替

```swift
typealias number = Int
let ten: number = 10
```

### 元組(Tuples)

Tuple可將多個值組合成群組形成一個值，如:`(123, "123", 1.23)`，在tuple中可放入任何型態的值，以下我們來練習建立一個iPhone的規格與價錢tuple

```swift
let iPhone6s = ("16g", 24500)
```

我們可以另外宣告其它常數或變數來對應tuple

```swift
let (type, price) = iPhone6s
print("Pricing of iPhone6s \(type) is $\(price)")
```

一般來說有幾個值在tuple內就需要相同數目的常數或變數來對應，但有些時後並不是每個值都需要，這裡可以使用`_`來略過對應的值

```swift
let (_, price2) = iPhone6s
print("Pricing of iPhone6s is $\(price2)")
```

上面還要再宣告新變數的方式會稍為有點麻煩，我們也可以使用索引(index)直接從tuple中取得值

```swift
print("Pricing of iPhone6s \(iPhone6s.0) is $\(iPhone6s.1)")
```


另外也可以在一開始宣告tuple時就加上名稱

```swift
let iPhone6s_plus = (type: "16g", price: 28500)
print("Pricing of iPhone6s \(iPhone6s_plus.type) is $\(iPhone6s_plus.price)")
```

Tuple可以快速的把多個值組成群組，這在暫時儲存幾個值的時後非常有用，但要用來儲存較複雜的資料結構就不是很適合，例如現在需要再新增一筆64g的iPhone6s就會非常難處理，判斷適合的情況來使用可以更有效的幫助你程式開發的效率。

### 可選擇項(Optionals)

> Optional並沒有很明確的翻譯，如有更佳的翻譯請不吝提供，謝謝

Optional表示一個常數或變數的值可存在也可不存在(nil)，並且當值存在的時後就會執行，不存在就不執行，這對開發者來說是個非常棒的概念，可以很明確的知道這個常數或變數有沒有可能會有nil產生，就算產生了nil，也常常可以在不跳出錯誤的情況繼續執行下去，下面就來宣告一個optional variable

```swift
var optionalVariable: Int?
print("Optional variable = \(optionalVariable)")
```

宣告為optional需在型態後面加上`?`，當不給予初始值時，optionalVariable會自動被設定為nil，這時後印出optionalVariable可以看到值為nil

```swift
optionalVariable = 10
print("Optional variable = \(optionalVariable)")
```

將10給予optionalVariable後再次印出，可看到印出的值為`Optional(10)`，這就表示值為optional，但這並不能直接使用，因為10這個數字是被包裝(wrapped)在optional裡，我們要取出值的話需要再使用`!`來解析(unwrapping)optional，明確表示我們需要取得這個值

```swift
if optionalVariable != nil {
    print("Optional variable = \(optionalVariable!)")
}
```

以上我們先用一個條件判斷式來確定optionalVariable並非nil，再使用!來取出optionaVariable的值

來看到另一個範例，這裡我想將一組字串轉換為數字，但我們可以想像的到並不是所有字串都可以轉換為數字，例如"123"可轉換為123，但想將"abc"轉換成數字時，會因為無法轉換而產生nil

```swift
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber) // convertedNumber is optional
let notNumber = Int("abc") // nil
```

由於possibleNumber在做轉換時可能產生nil，因此回傳的結果是optional，藉由型別推斷convertedNumber也是optional

### 可選擇項繫結(Optional binding)

在條件判斷式中如`if`、`while`等，我們可能會想先判斷說這個值存不存在，如果存在再來進行其它動作，這時後使用optional binding可以讓我們更快速的達成效果，以上面的範例來看，如果我們用一般的方式判斷

```swift
if convertedNumber != nil {
    // possibleNumber可轉換成數字
    print("\(possibleNumber) has an integer value of \(convertedNumber)")
} else {
    // possibleNumber不可轉換成數字
    print("\(possibleNumber) could not be converted to an integer")
}
```

使用optional binding時可以自動判斷這個optional是否存在值，存在的話就會執行，不存在就不執行

```swift
if let actualNumber = Int(possibleNumber) {
    // possibleNumber可轉換成數字
    print("\(possibleNumber) has an integer value of \(convertedNumber)")
} else {
    // possibleNumber不可轉換成數字
    print("\(possibleNumber) could not be converted to an integer")
}
```

optional binding還可以搭配where來達到更複雜的條件判斷，當字串"10"可以被轉換成數字時會儲存到smallNumber，"50"可被轉換成數字時存到bigNumber，而只要其中一個條件不成立整個判斷就不會執行，當兩組字串都可以被轉換時，再加上where來判斷說smallNumber確實小於bigNumber，整個條件判斷才算完整成立

```swift
if let smallNumber = Int("10"), bigNumber = Int("50") where smallNumber < bigNumber {
    print("\(bigNumber) bigger than \(smallNumber)")
}
```

### 隱式解析可選擇項(Implicitly Unwrapped Optionals)

有些時後我們可以很肯定的知道某些結果，例如我們可以很肯定"8"一定是數字，轉換時不可能會失敗，那我們可以省略上面範例的步驟，直接在型態後面加上`!`，這樣轉換完後的結果就會自動unwrapping，就不需要在每次加上!來解析，但需要注意的是如果結果還是產生了nil，那麼程式就會拋出錯誤，使用上要非常清楚程式執行的邏輯，不然應避免使用

```swift
let currentNumber: Int! = Int("8")
print("current number is \(currentNumber)")
```
