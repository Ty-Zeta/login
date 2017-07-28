def calculator(calc, num1, num2)
    if  calc == "plus"
        answer = num1.to_i + num2.to_i
    end
    
    if calc == "minus"
        answer = num1.to_i - num2.to_i
    end

    if calc == "times"
        answer = num1.to_i * num2.to_i
    end

    if calc == "divided by"
        answer = num1.to_i / num2.to_i
    end
    answer.to_s
end