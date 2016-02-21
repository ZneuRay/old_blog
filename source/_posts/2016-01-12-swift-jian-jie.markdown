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

這裡會記錄Swift的基礎語法到較進階的用法，那目前我學習的方法是用最基本的方式，直接看說明書，也就是Apple出的[The Swift Programming Language Swift 2.1 Edition][Swift book]，這本書在`iBook`上就可以看了，我也是平時沒事就拿著ipad來翻，算是滿方便。

另外這本書台灣目前也有團隊在翻譯，可以參考[《The Sw­ift Pr­ogramm­ing La­nguage­》正體中文版][Swift book chinese]，不過現在還是舊版的，2.0版還在翻譯中，目前我看的官方版是Swift 2.1，會比舊版的還多出一些部份。

學習的過程大致上是以官方這本書為主，學習的版本是Swift 2.1，會記錄下一些心得與特性還有和其他程式語言不同的部份。

Swift 導覽
---

這邊就先讓我們快速的看一下Swift的語法與特性，詳細的後面會再說明

```swift
print("Hello")
```

### Simple value 簡單值

Swift中有`let`(常數)跟`var`(變數)，並有很強的型別推斷，在很多時後都可以省略型別

```swift
let constantWithType = 20 // Integer
let constantWithoutType: Double = 12.0 // Double

var number = 5
number = 8

var string = ""
```




[Swift]: http://www.apple.com/tw/swift/
[Swift book]: https://itunes.apple.com/tw/book/swift-programming-language/id881256329?l=zh&mt=11
[Swift book chinese]: https://www.gitbook.com/book/tommy60703/swift-language-traditional-chinese/details