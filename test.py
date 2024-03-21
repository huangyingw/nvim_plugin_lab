# 导入必要的库
import matplotlib.pyplot as plt
import numpy as np

# 基本数学运算
a = 10
b = 5
print("a + b =", a + b)
print("a - b =", a - b)

# 定义一个函数，计算平方
def square(x):
    return x * x

print("10 的平方是", square(10))

# 列表推导式示例
squares = [square(x) for x in range(10)]
print("0 到 9 的平方列表:", squares)

# 使用 numpy 生成一组数据
x = np.linspace(0, 10, 100)

# 计算这组数据的正弦值
y = np.sin(x)

# 使用 matplotlib 绘图
plt.plot(x, y)
plt.xlabel('x')
plt.ylabel('sin(x)')
plt.title('Sin(x) 的图像')
plt.show()
