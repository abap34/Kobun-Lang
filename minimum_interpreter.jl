using Random

abstract type KobunExpr end

debug = false

Field = Dict(
    "Variable" => Dict(),
    "Functions" => Dict()
)

function var_def(line)
    name = join(collect(line)[2:end - 3])
    if debug
        println("[info] def `$name`")
    end
    Field["Variable"][name] = Nothing
end

function func_def(line)
    name = split(line, "「")[1]
    line = collect(line)
    c_st = findall(s -> s == '「', line)
    c_en = findall(s -> s == '」', line)
    arg = join(line[c_st[1] + 1:c_en[1] - 1])
    def = join(line[c_st[2] + 1:c_en[2] - 1])
    func_hash_name = randstring('a':'z', 30)
    Field["Functions"][name] = func_hash_name
    tr_expr = "$name($arg) = $def"
    dummy_expr = "$func_hash_name($arg) = $def"
    if debug
        println("[info] def function `$tr_expr`")
    end
    eval(Meta.parse(dummy_expr))
end

function call(line)
    line = collect(line)
    c_st = findall(s -> s == '「', line)
    c_en = findall(s -> s == '」', line)
    name = join(line[1:c_st[1] - 1])
    arg = join(line[c_st[1] + 1:c_en[1] - 1])
    result = eval(Meta.parse(replace(split(Field["Functions"][name], "(")[1] * "($arg)", " " => "")))
    to = join(line[c_st[2] + 1:c_en[2] - 1])
    if debug
        println("[info] call function `$name`, arg: $arg.")
        println("[info] result = $result. store the result in `$to`")
    end
    Field["Variable"][to] = result
end

function _print(line)
    line = collect(line)
    c_st = findall(s -> s == '「', line)
    c_en = findall(s -> s == '」', line)
    println("OUT:", Field["Variable"][join(line[c_st[1] + 1:c_en[1] - 1])])
end


function trait(line)
    if occursin(r"あり", line)
        return "var_def"
    elseif occursin(r"を得て", line)
        return "func_def"
    elseif occursin(r"言ひて", line)
        return "func_call"
    elseif occursin(r"あな", line)
        return "print"
    else
        error("ignore format")
    end
end


source = join(readlines())


for line in split(source, "。")
    if line == "!debug"
        global debug = true 
        println("[info] Run in debug mode.")
        println("=========================")
        continue
    end
    line = replace(line, "\n" => "")
    (line == "") && (continue)
    pettern = trait(line)
    if debug
        println("[read] $line")
        println("[trait] $pettern")
    end
    if pettern == "var_def"
        var_def(line)
    elseif pettern == "func_def"
        func_def(line)
    elseif pettern == "func_call"
        call(line)
    elseif pettern == "print"
        _print(line)
    end
    println()
end

