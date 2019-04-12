<!--姚晨峰-->
# iOS开发
## 安装环境
### 基础环境安装
* 安装mac 开发工具
> xcode-select --install
* 安装 Homebrew
> /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


* 安装rvm

```
curl -L get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm install 2.5
rvm 2.5 --default
```

* 安装bundler
```
gem install bundler
bundle config mirror https://rubygems.org https://gems.ruby-china.com
```

### 依赖库管理安装
```
gem install cocoapods
brew install carthage
```

## 依赖安装(可选对应的管理工具)

pod安装
> pod install

carthage安装依赖
> carthage bootstrap --no-use-binaries --platform iOS

carthag更新
> carthage update --platform iOS
也可以通过build
> carthage build --platform iOS
