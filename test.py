from sprints import MyFunc

def test_1():
    assert MyFunc([2,1.1]) == [2,1.1]
def test_2():
    assert MyFunc([2,4,6,0,1.1,2,2.2]) == [2.8,2.2] 

test_1()
test_2()
print("passed")
