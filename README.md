# HackerrankIt
Command line tool to initialize a small project directory to solve a problem.

## Supported Languages
1. C++

## Installation
Assume you already have Ruby installed in your environment.

```
gem install hackerrankit
```

## Usage
`hackerrankit` will treat your current working directory as the root point to create separated directory for each problem you are going to solve.

```
hackerrankit [url] [language]
```

where `[url]` is the url to the problem on Hackerrank.
`language` is the language you are going to solve the problem. To keep this gem simple, I don't consider the situation where you want to solve a problem with more than one language. Default: `C++`.

## What `hackerrankit` actually does
After you issue `hackerrankit`, it does the following steps:

1. Silently go to the url to extract information about that problem such as `name`, `sample input`, `sample output`.
2. Base on the `name`, it creates a directory inside your current working directory whose name equals to the problem's name replaced spaces with `-` character. Example: `ACM ICPC Team` -> `ACM-ICPC-Team`.
3. Base on the language you specified in the command, it creates minimal necessary files for you to start working on the problem right a way. For example, with `C++`, it creates `main.cpp`, `sample.input`, `sample.out`, and `run.sh` for you to compile your solution, run it with `sample.input` and compare to `sample.output`. Its output is either `Accepted` or `Wrong Answer`.
4. `hackerrankit` will try its best to initialize your `main.cpp` with useful declarations so you don't need to worry about them everytime you want to practising problem solving. For example: with `C++`, it will have common includes and useful `#define`, `main` function.

## Want to contribute?
This is firstly my gem to make my problem solving practising less time consuming so I will only focus on the language that I use. Currently is `C++`.

If you want to support your preferred language such as `Ruby`, `Python`, `Java`, `C`, `Pascal` whatever. Feel free to folk and make a PR. Or you just want to make it for yourself, feel free to copy the tool. Even nicer if you can give this repository a star which would definitely make my day.
