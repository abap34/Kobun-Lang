abstract type KobunExpr end

struct VarDef <: KobunExpr
    type 
    name
end

function VarDef(line)
    if occursin(r"整数", line)
        _type = Int
    elseif occursin(r"実数", line)
        _type = String
    elseif occursin(r"実数", line)
        _type = Float
    else
        error("ignore type")
    end
    name = collect(line)[3:end-2]
    return VarDef(type, name)
end

struct FuncDef <: KobunExpr
    arg
    def
    name
end

function FuncDef(line)
    name = split(line, "、")[1]
    c_st = findall(s -> s == '「', collect(line))
    c_en = findall(s -> s == '」', collect(line))
    arg = line[c_st[1]:c_en[1]
    def = line[c_st[2]:c_en[2]]
    return FuncDef(arg, def, name)
end

struct FuncCall <: KobunExpr
    name
    result
    to
end

function FuncCall(line)
    
end

function get_type_of_line(line)
    if occursin(r"あり", line)
        return "var-def"
    elseif occursin(r"を得て「.+」を返さむ", line)
        return "func-def"
    elseif occursin(r".+と言ひて、.+これを得たり", line)
        return "func-call"
    elseif occursin(r"あな、「.+」事かな", line)
        return "print"
    else
        return "ignore format"
    end
end


function compile(line)
    
end


sorce = """
整数aあり。
整数bあり。
文字列cあり。

大殿、「a」を得て「2 * a」を返さむ。
大殿「10」と言ひて、aこれを得たり。

あな、「a」事かな。
"""

compiled = ""
for line in split(sorce, "。")
    (line == "") && (continue)
    println("$line : ($(get_type_of_line(line)))")
    transed_code *= compile(line)
end


@show  compiled