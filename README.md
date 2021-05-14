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


#### source

```
# fizzbuzz.kobunn
「ゴミ箱」あり。
フィズバズ太郎「i」を得て「(i->println((x="Fizz"^(i%3÷2)*"Buzz"^(i%5÷4))>"" ? x : i+1)).(0:99)」を返さむ。
フィズバズ太郎「100」と言ひて「ゴミ箱」これを得たり。
```

#### result
```
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
16
17
Fizz
19
Buzz
Fizz
22
23
Fizz
Buzz
26
Fizz
28
29
FizzBuzz
31
32
Fizz
34
Buzz
Fizz
37
38
Fizz
Buzz
41
Fizz
43
44
FizzBuzz
46
47
Fizz
49
Buzz
Fizz
52
53
Fizz
Buzz
56
Fizz
58
59
FizzBuzz
61
62
Fizz
64
Buzz
Fizz
67
68
Fizz
Buzz
71
Fizz
73
74
FizzBuzz
76
77
Fizz
79
Buzz
Fizz
82
83
Fizz
Buzz
86
Fizz
88
89
FizzBuzz
91
92
Fizz
94
Buzz
Fizz
97
98
Fizz
Buzz
```