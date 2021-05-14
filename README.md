# What this

![](https://cdn.discordapp.com/attachments/810478331790491681/842794985131868260/unknown.png)

# Usage


#### source
```
# Hello_Otono.kobun
!debug。

「a」あり。
「b」あり。

大殿「a」を得て「2 * a」を返さむ。
大殿「10」と言ひて「a」これを得たり。

あな「a」事かな。
```

```sh
julia minimum_interpreter.jl < Hello_Otono.kobun   
```


#### result
```
[info] Run in debug mode.
=========================
[read] 整数「a」あり
[trait] var_def
[info] def `a`

[read] 整数「b」あり
[trait] var_def
[info] def `b`

[read] 大殿「a」を得て「2 * a」を返さむ
[trait] func_def
[info] def function `大殿(a) = 2 * a`

[read] 大殿「10」と言ひて「a」これを得たり
[trait] func_call
[info] call function `大殿`, arg: 10.
[info] result = 20. store the result in `a`

[read] あな「a」事かな
[trait] print
OUT:20
```
