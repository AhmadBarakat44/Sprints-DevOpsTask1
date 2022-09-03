from statistics import mean
def MyFunc(my_list): 
    ints = [val for val in my_list if isinstance(val, (int))]
    floats =[val for val in my_list if isinstance(val, (float))]
    evens = []
    for i in ints:
        if i % 2 == 0:
            evens.append(i)
    if not ints:
        print("no ints returning 0")
        return(0)
    if not floats:
        print("no floats returning 0")
        return(0)
    
    Mean = mean(evens)
    Fmax = max(floats)
    return([Mean,Fmax])

