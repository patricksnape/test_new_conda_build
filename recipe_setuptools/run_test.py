import demo

def test_hello():
    ret = demo.test()
    assert(ret == 42)

if __name__ == '__main__':
    test_hello()
