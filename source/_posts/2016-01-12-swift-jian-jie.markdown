---
layout: post
title: "開始學習Swift"
date: 2016-01-12 01:01:50 +0800
date_formatted: 01:01 Jan 12, 2016
comments: true
categories: Swift
published: false
keywords: Swift, iOS developer, Ruby, Ruby On Rails, programming, coding, Octopress, 用嘴寫code
description: 一個記錄Swift學習過程的網站
---

簡介
===

[Swift][]是由Apple所創造用來開發iOS、OX S、watch OS和tvOS的一個全新程式語言，集合了舊有的Objective-C的優點並加入更多安全的程式操作跟特色，讓程式的開發變的更容易。

<!-- more -->

我目前是專職Android app與Ruby On Rails web developer，從手機app前端到server後端，因為有些需求所以想再來學習iOS的開發，並且可以同時了解兩個平台開發遇到的狀況，所以開始學習了Swift，Swift對我來說算是個全新的程式語言，特別架設了這個Blog來寫下學習的過程與心得，這也是我第一次寫部落格，可能還有許多用詞語法較不通順，還請多包涵。

以前我只寫過c與c++，並沒有寫過Objective-C，所以在本站並不會看到Swift與Objective-C的比較，iOS的開發我也是從來沒碰過，這裡會一步步記錄從Swift的基礎語法到較進階的用法，最後會實際開發，那目前我學習的方法是用最基本的方式，直接看說明書，也就是Apple出的[The Swift Programming Language Swift 2.1 Edition][Swift book]，這本書在`iBook`上就可以看了，我也是平時沒事就拿著ipad來翻，算是滿方便。

另外這本書台灣目前也有團隊在翻譯，可以參考[《The Sw­ift Pr­ogramm­ing La­nguage­》正體中文版][Swift book chinese]，不過現在還是舊版的，2.0版還在翻譯中，目前我看的官方版是Swift 2.1，會比舊版的還多出一些部份。

學習的過程大致上是以官方這本書為主，學習的版本是Swift 2.1，記錄下一些心得與特性還有和其他程式語言不同的部份，因為我在程式語言上已經不算初學者了，可能有些部份會被我略過，但我還是會盡力詳細的寫下我所想到的一些狀況。

Swift 導覽
---

這邊就先讓我們快速的看一下Swift的語法與特性，詳細的後面會一篇一篇說明

```swift
print("Hello")
```

### Simple value 簡單值

Swift中有`let`(常數)跟`var`(變數)，Swift有很強的型別推斷，在很多時後都可以省略型別

```swift
let constantWithType: Int = 20 // Integer
let constantWithoutType = 12.0 // Double

var number = 5
number = 8

var string = ""
```




[Swift]: http://www.apple.com/tw/swift/
[Swift book]: https://itunes.apple.com/tw/book/swift-programming-language/id881256329?l=zh&mt=11
[Swift book chinese]: https://www.gitbook.com/book/tommy60703/swift-language-traditional-chinese/details