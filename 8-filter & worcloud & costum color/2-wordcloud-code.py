from newspaper import Article

article = Article('https://id.wikipedia.org/wiki/Sulawesi')
article.download()
article.parse()
article.text

from wordcloud import WordCloud, ImageColorGenerator, STOPWORDS
import matplotlib.pyplot as plt
import numpy as np
from PIL import Image

background_image = np.array(Image.open('8-datavis-trik/2-bgbg.jpg'))
img_colors = ImageColorGenerator(background_image)
wc = WordCloud(background_color = 'black', 
  width = 1920, height = 1080)
wc.generate_from_text(article.text)
wc.to_file('8-datavis-trik/222-wordcloud.png')

Wordcloud merupakan salah satu bentuk diagram yang digunakan untuk visualisasi teks
Semakin besar ukuran kata pada wordcloud, menandakan kata tersebut memiliki frekuensi
yang besar pada teks yang kita olah.

Biasanya wordcloud disajikan dalam bentuk kotak. Hal ini kadang membuat visualisasi
terlihat membosankan. Kita bisa mengatur tata letak kata berdasarkan backround yang kita
inginkan. Contohnya Wordlcloud berbentuk Pulau Sulawesi. 

Sumber background: https://id.depositphotos.com/

#dataviz #datavis #wordcloud #dataisbeautiful #visualisasidata
#python
