# Usage

```
# Hello_Otono.kobun

!debug。

整数「a」あり。
整数「b」あり。

大殿「a」を得て「2 * a」を返さむ。
大殿「10」と言ひて「a」これを得たり。

あな「a」事かな。
```

```sh
julia minimum_compiler.jl < Hello_Otono.kobun   
```


### result
```
[info] デバッグモードで実行
[read] 整数「a」あり
[trait] var_def

[read] 整数「b」あり
[trait] var_def

[read] 大殿「a」を得て「2 * a」を返さむ
[trait] func_def

[read] 大殿「10」と言ひて「a」これを得たり
[trait] func_call

[read] あな「a」事かな
[trait] print
OUT:20
```
