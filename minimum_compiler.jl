using Random


abstract type KobunExpr end

DEBUG = false

Field = Dict(
    "Variable" => Dict(),
    "Functions" => Dict()
)

function var_def(line)
    if occursin(r"整数", line)
        _type = Int
    elseif occursin(r"実数", line)
        _type = Float
    else
        error("ignore type")
    end
    name = collect(line)[4:end-4]
    Field["Variable"][name] = Nothing
end

function func_def(line)
    name = split(line, "「")[1]
    line = collect(line)
    c_st = findall(s -> s == '「', line)
    c_en = findall(s -> s == '」', line)
    arg = join(line[c_st[1] + 1:c_en[1] - 1])
    def = join(line[c_st[2] + 1:c_en[2] - 1])
    func_hash_name = randstring(30)
    Field["Functions"][name] = func_hash_name
    eval(Meta.parse(join([func_hash_name, "(", arg, ") = ", def])))
end

function call(line)
    line = collect(line)
    c_st = findall(s -> s == '「', line)
    c_en = findall(s -> s == '」', line)
    name = join(line[1:c_st[1]-1])
    arg = join(line[c_st[1]+1:c_en[1]-1])
    result = eval(Meta.parse(replace(split(Field["Functions"][name], "(")[1] * "($arg)", " " => "")))
    to = line[c_st[2]+1:c_en[2]-1]
    Field["Variable"][to] = result
end

function _print(line)
    line = collect(line)
    c_st = findall(s -> s == '「', line)
    c_en = findall(s -> s == '」', line)
    println("OUT:", Field["Variable"][line[c_st[1]+1:c_en[1]-1]])
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
        global DEBUG = true 
        println("[info] デバッグモードで実行")
        continue
    end
    line = replace(line, "\n" => "")
    (line == "") && (continue)
    pettern = trait(line)
    if DEBUG
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

