---
layout: post
title: "Octopress + Github 打造自已的Blog"
date: 2016-01-07 18:28:26 +0800
date_formatted: 18:28 Jan 7, 2016
comments: true
categories: [Blog, Github, Octopress]
---

部落格誕生
===

一直以來都沒有寫作的習慣，最近深刻的體會到任何事情當下都覺得這麼印象深刻，怎麼可能會忘記呢？結果只過了一個禮拜就想不起來…真的事情不寫下來非常容易忘記，因此起了念頭，把學習的心得都寫下來吧！也正好最近開始學習Swift，就找個部落格來記錄學習的心得。

<!-- more -->

因為想要記錄Swift的學習心得，需求的部份希望能支援Swift syntax highlighting，介面要簡潔，這樣就足夠了，於是尋找的過程中看了一些部落格，大部份拿來寫遊記、食記等的部落格就不提了，以下列出幾個我有考慮使用的Blog :

* [Blogger][]
* [WordPress][]
* [Ghost][]
* [Logdown][]
* [Octopress][]

最後我選擇了使用**Octopress**，下面來簡單介紹一下每個Blog

### Blogger

這是Google自已的Blog，有Google帳號就可以登入使用，但介面與操作我不太喜歡，而且沒有能放code的區塊，要自已進html加上css與javascript才會有syntax highlighting的功能，非常不方便，所以沒有使用。

### WordPress

一個open source的blog，功能非常強大，只要找一台Server就可架設，現在又有很多租用的Server都直接支援架設WordPress，WordPress自已本身也提供線上免費版，其實非常夠用了，原本打算就直接使用WordPress，但是發現免費版的目前並不支援Swift syntax highlighting(支援的語言請[參考][WordPress_Syntax_highlighting])，也無法安裝外掛，所以先擺著看看還有沒有其他的Blog。

### Ghost

同樣是open source的blog，架構使用node.js，目的就是為了簡潔快速，畫面還滿漂亮，並且使用**Markdown**來編輯，當時有心動打算使用，但想到要找台nodejs的Server較麻煩，目前也不打算自已架Server，所以也先擺著。

> #### Markdown簡介

>[Markdown][]是一種易讀易寫的格式，用一些簡單的符號就可以進行整篇文章的排版，像現在看到的這篇文章就是使用Markdown格式寫成的，Markdown原本就支援code block，再加上Github以Markdown設計出[GitHub Flavored Markdown][GFM]，支援了大部份語言的syntax highlighting，當初希望在記錄Swift學習心得時能有個漂亮的顏色顯示，所以選擇了有支援Markdown的Blog。

```swift
var name: String = "Ray"

func sayHello(to person: String) -> Void {
	print("Hello \(person)")
}

sayHello(to: name) // "Hello Ray"
```

### Logdown

由XDite的團隊設計，目的就是要能方便貼code、貼圖等，專門設計給程式設計師的Blog，當時其實已經在安裝Octopress，過程中不小心看到的，試用了一下覺得還算不錯，同樣使用Markdown編輯，畫面清析簡單，也提供免費版，對程式設計師又不想自已架設Blog的人非常推薦使用。



### Octopress

這就今天的主角，一個畫面功能簡潔，也同樣是以Markdown來編輯的Blog，並且搭配Github pages就可以架設，整個Blog也可自行修改客製，因此最後選擇了Octopress。

因為Octopress安裝架設會需要一點技術知識背景，也沒有提供後台管理，發佈文章更改設定等都需要自己手動修改產生，新手的話就需要多花點時間努力學習，懶人的話推薦去使用Logdown就非常好用了。

開始安裝
===

安裝大致上就參考官網所寫的[文件][Octopress_setup]
步驟為以下所列 : 

1. Github帳號並設定Github pages
2. Ruby與Javascript環境
3. 安裝Octopress

### Github

先去[Github][]辦個帳號，接著建立Github pages([官網][Github pages])，但不要照著官網做，我們只需要新增一個repository並取名為 :

**`username.github.io`** 

**username** 是你的帳號，全小寫就好，千萬不要跟著打username上去，像我的帳號是zneuray，就打`zneuray.github.io`，這也是你網站的位置，建好後你就擁有一個基本的網站了。

### Ruby

`OS X 10.11`內建就有`Ruby-2.0.0`，目前Octopress僅需要`1.9.3`以上的版本即可，可以直接略過這步

因為最新版本的`Ruby-2.3.0`，如果想更新的再照以下方式安裝，我的`Ruby`環境已經安裝好了，沒辦法再實際安裝一次，因此這邊就參考其他[網站][ruby_install]安裝教學，簡單列一下更新步驟

安裝環境 : `OS X 10.11`

```sh
1. 安裝homebrew
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

2. 安裝gpg
$ brew install gpg
$ command curl -sSL https://rvm.io/mpapis.asc | gpg --import -

3.1 安裝rvm
$ \curl -L https://get.rvm.io | bash -s stable
$ source ~/.rvm/scripts/rvm

3.2 已經有安裝rvm的可以用以下指令取得最新版rvm
$ rvm get stable --autolibs=enable

4. 安裝最新版ruby
$ rvm install ruby-2.3.0
```

### Octopress

接下來就開始安裝Octopress，在console使用git將整個repository下載回來，最後面octopress為下載的資料夾，可自行更換

```sh
$ git clone git://github.com/imathis/octopress.git octopress
```

> 另外推薦圖型化介面的git管理套件 [SourceTree][]

進入資料夾octopress

```sh
$ cd octopress
```

接下來要安裝相依套件，這部份是屬於`Ruby`環境建置的一部份，在這之前你應該先安裝好`Ruby`，`Ruby`的套件管理程式有`RVM`與`rbenv`，本篇文章以`RVM`為主

```sh
$ gem install bundler
$ bundle install
```

> 如果使用rbenv記得要在每次執行`gem install`後使用`rbenv rehash`重新整理一次

安裝Octopress，這邊的安裝其實就是安裝你的theme，後面沒加參數就是使用預設的theme，theme的部份後面會介紹，先讓我們安裝完

```sh
$ rake install
```

從這邊我們可以看到安裝就是從theme的資料夾中把source跟sass複製到你的Blog資料夾，source裡面就是如何產生你的Blog頁面資料，就是產生html部份，sass則是產生Blog樣式，也就是產生css，只要會修改這邊就可以自行設計樣式

> \#\# Copying classic theme into ./source and ./sass  
> mkdir -p source  
> cp -r .themes/classic/source/. source  
> mkdir -p sass  
> cp -r .themes/classic/sass/. sass  
> mkdir -p source/_posts  
> mkdir -p public  


再來要設定Blog環境

```sh
$ rake setup_github_pages
```

> Enter the read/write url for your repository  
> (For example, 'git@github.com:your_username/your_username.github.io.git) or 'https://github.com/your_username/your_username.github.io')  
> Repository url:

輸入你的Github pages網址，username記得要換成你的帳號

```
https://github.com/username/username.github.io
```

這裡會自動幫你把repository remote設到你輸入的github repository，並幫你新增一個branch叫`source`，未來檔案都在`source`這個branch修改，要發表新文章也同樣是在這

下一步就是產生網頁並發佈，`source`裡的檔案都是含程式碼的原始檔，包含新發表的Markdown文章也同樣是放在這邊，這一步就是把這些檔案全部轉成html放到`_deploy`資料夾中，並使用`deploy`指令幫你把`_deploy`資料夾中的檔案push到remote

```sh
$ rake generate
$ rake deploy
```

到這邊Octopress安裝就算完成了，可以看到目前會有2個branch，分別為`source`與`master`，之後都只要修改`source` branch就好，`master`交給rake來管理就好了，記得`source`有修改過的部份再`commit`上去就可以。

```sh
$ git add .
$ git commit -m 'your message'
$ git push origin source
```

目錄結構
===

簡單列出幾個比較需要知道的目錄

```ruby
octopress
+-- .themes #theme都放這邊
+-- _deploy #執行rake generate後產生的檔案放到這，也就是要上傳的完稿，使用rake deploy上傳至github pages
+-- sass #Blog樣式
+-- source
|	+-- _includes #其他附加的原始html
|	+-- _layouts #幾個主頁面的原始html
|	+-- _posts #文章存放的地方
|	+-- about #自我介紹存放的地方
|	+-- images #存放圖片的地方
+-- _config.yml #Octopress主要的設定檔
```

Blog設定
===

首先我們需要來設定Blog的資訊，主要的設定都在`_config.yml`，這是`yaml`格式的檔案，基本格式就是`設定名稱: 設定值`，非常容易就可以修改，檔案中還有其他設定再依自已需求調整即可，這裡列出最基本的Blog資訊

```yaml
url: "http://zneuray.github.io"
title: "用嘴寫code"
subtitle: "說的一口好程式"
author: "Ray"
simple_search: "https://www.google.com/search"
description: "Android app / Ruby / Rails web developer"
```


發表新文章
===

發表新文章非常簡單，只要輸入以下指令，`title`輸入文章的標題就可以

```sh
$ rake new_post["title"]
```

> 如果你使用的是zsh，因為[ ]在zsh中有另外的作用，所以這行指令會無法執行，要改用以下方式輸入
>  

```sh
$ rake "new_post[title]"
或
$ rake new_post\["title"\]
```

執行完後會在`source/_posts/`底下產生一個新的檔案，格式是`年-月-日-標題.markdown`，這就是剛建立的新文章，直接用編輯器打開來編輯就可以了。

打開新建立的文章會看到裡面已經預先幫我們填好一些資訊

```yaml
---
layout: "post"
title: "Octopress + Github 打造自已的Blog"
date: "2016-01-07 18:28:26 +0800"
comments: true
categories: "Octopress"
published: true
---
```

- layout: 指定使用哪個layout，這裡寫`post`意思就是對應到`source/_layouts/post.html`這個layout
- title: 文章標題
- date: 文章日期
- comments: 允不允許留言
- categories: 會自動幫你產生文章分類
- published: 如果不想發佈這篇文章時可設定成false

編輯完的文章在Blog主頁面會直接看到整篇文章，如果文章多的話會造成整個主頁面非常的長，也不方便找文章，因此我們在文章寫完一段`前言`時加上一行語法

```html
<!-- more -->
```

在這行語法後的文章就不會出現在主頁面，而會顯示一個`更多`的按鈕讓你點入觀看文章，這樣就可以整理好主頁的版面，這串語法是在`_config.yml`中設定的，如果發現語法沒效果請檢查你的`_config.yml`是否有做修改

### 本篇文章編輯的範例
{% img /images/blog/48cd89ea8b201ee0e5fd/5f88861b8fc71281dec0d33b481d2bd4b43c988f.png %}

### 預覽
寫文章時我們當然想看一下目前編輯出來的文章到底長什麼樣子，`Octopress`也提供了預覽的指令

```sh
$ rake preview
```

> Starting to watch source with Jekyll and Compass. Starting Rack on port 4000  
> [2016-01-07 23:28:45] INFO  WEBrick 1.3.1  
> [2016-01-07 23:28:45] INFO  ruby 2.2.1 (2015-02-26) [x86_64-darwin14]  
> [2016-01-07 23:28:45] INFO  WEBrick::HTTPServer#start: pid=39559 port=4000  
>  

輸入指令後就我們就可以看到`Octopress`自動執行`rake generate`後幫我們啟動了一個`web server`並開啟`port 4000`讓我們可以連線進入，接下來打開你的瀏覽器並輸入網址[127.0.0.1:4000][localhost]，就可以預覽你目前的Blog，這個方式會佔用一個terminal，在預覽完後按`ctrl + c`關閉才可以繼續使用該terminal。

### pow

另外推薦一個簡單的web server套件[pow][]，在寫RoR時因為常常要預覽網頁，但每次都要啟動關閉server實在很麻煩，因此安裝`pow`，`pow`會根據目前專案的設定來啟動一個server，除非有更改到設定的部份才需要重啟，不然就從此放著不管他就可以了。

安裝`pow`非常簡單，只需要一行指令，就可以完成安裝

```sh
$ curl get.pow.cx | sh
```

接下來設定你的專案，`/path/to/octopress`的部份換成你的Blog的路徑

```sh
$ cd ~/.pow
$ ln -s /path/to/octopress octopress
```

完成後未來只要開啟`專案名.dev`的網址就可以看到你的Blog，如果專案名是octopress，那就開啟[octopress.dev][octopress_dev]網址，記得每次編輯完還是要下`rake generate`才會更新你的Blog

如果你使用`pow`的話，有一個`pow`的管理套件叫做`powder`，讓你可以更方便的管理`pow`，安裝的方式如下

```sh
$ gem install powder
```

安裝了`powder`後就不需要再使用上面的方式設定Blog，只要進入你的Blog資料夾輸入指令，就會自動幫你設定Blog

```sh
$ powder link
```

其他`powder`指令

```sh
$ powder start #啟動pow
$ powder restart #重新啟動pow
$ powder stop #停止pow
$ powder unlink #解除專案連結
$ powder open #自動使用瀏覽器開啟專案的網址
```

### Octopress theme

Octopress theme的安裝非常簡單，在Octopress的[Wiki][octopress wiki]上已經收集了不少的theme，選擇你想要安裝的theme進入他的github，把theme使用git clone到你`.theme`的目錄再安裝就好了，每個theme也都有教你安裝方式，除了有些theme有另外增加新功能需要你去設定外，大致上都差不多

以本站來說，選擇的是[Oct2]這個theme，下面範例就使用這個theme來做安裝，選擇其他theme的記得要換掉網址，不要造著輸入

```sh
$ git clone https://github.com/bijumon/oct2.git .themes/
$ rake install["oct2"]
# 記得像zsh的話需要使用 rake "install[oct2]"
$ rake generate
```

這樣我們就完成theme的安裝並產生新的Blog了，這邊可以下rake install["oct2"]是因為我們把oct2的source放到`.theme`底下了，看一下`.theme`的資料夾發現裡面還有一個classic，這個就是原始octopress的theme，所以想換回來的話只要`rake install["classic"]`就可以了

### 增加留言功能

想要增加留言功能的話我們直接使用`Octopress`支援的[Disqus][]就好了，`Disqus`是一套整合的留言版管理系統，幫你整合各大社群登入與留言，安裝也非常快速簡單。

要在`Octopress`上使用`Disqus`，需要先到`Disqus`官網註冊一組帳號才行

1. 首先開啟文章支援留言的功能，在文章的最上方將`comments`設定為`true`，代表本篇文章開啟留言，不想開留言的文章設定為`false`即可
2. 進入[Disqus][]註冊一個帳號
3. 回到首頁看到右上角有個齒輪點擊選擇`Add Disqus To Site`
4. 按下Start Using Engage
5. 輸入你的Blog網址並取一個唯一的名稱設定`Disqus`網址，你設定的這組唯一的名稱叫做`shortname`(不包含`.disqus.com`)，未來這組`shortname.disqus.com`就是你留言版的網址
6. 回到Blog開啟`_config.yml`找到下面這一行填入你的shortname
```yaml
disqus_short_name: 
```
7. 重新產生Blog並發佈
```sh
$ rake generate
$ rake deploy
```

這樣你的Blog就新增了留言的功能

恭喜
===

順利安裝完`Octopress`後就代表你已經擁有一個自已的Blog了，現在我也是剛裝好`Octopress`開始使用，還有非常多的功能目前我也還沒使用到，未來在寫新文章的過程有用到新的功能時再更新上來吧。

[Blogger]: https://www.blogger.com
[WordPress]: https://tw.wordpress.org/
[Ghost]: https://github.com/tryghost/Ghost
[Logdown]: http://logdown.com/
[Octopress]: http://octopress.org/
[WordPress_Syntax_highlighting]: https://en.support.wordpress.com/code/posting-source-code/
[Markdown]: http://markdown.tw/
[GFM]: https://help.github.com/articles/github-flavored-markdown/
[Octopress_setup]: http://octopress.org/docs/setup/
[Github]: https://github.com/
[Github pages]: https://pages.github.com/
[ruby_install]: http://railsapps.github.io/installrubyonrails-mac.html
[SourceTree]: https://www.sourcetreeapp.com/
[localhost]: http://127.0.0.1:4000
[pow]: http://pow.cx/
[octopress_dev]: http://octopress.dev/
[octopress wiki]: https://github.com/imathis/octopress/wiki/3rd-Party-Octopress-Themes
[Oct2]: https://github.com/bijumon/oct2
[Disqus]: https://disqus.com