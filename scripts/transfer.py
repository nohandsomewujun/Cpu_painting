# written by DingCheng


from PIL import Image
import numpy
import matplotlib.pyplot as plt
"""
img = Image.open('3.jpg')
print(img.size)
new_img = img.resize((200,150))
print(new_img.size)
new_img.save('bg4.jpg')

"""
img = plt.imread('bg4.jpg')
print(img.shape)
with open("bg2.coe", mode="w+") as f:
    for i in range(0,150):
        for j in range(0,200):
            number = (img[i,j,2]//16)*256 + (img[i,j,1]//16)*16 + (img[i,j,0]//16)
            #print(round(img[i,j,2]/16))
            number = hex(number)
            f.write(number[2:])
            f.write('\n')
    f.write(';')
