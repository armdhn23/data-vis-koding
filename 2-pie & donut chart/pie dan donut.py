# pie chart
import pandas as pd
import plotly.express as px

data_ekspor = pd.read_csv('2-pie & donut chart/data/ekspor perikanan.csv')

fig = px.pie(data_ekspor, values='volume', names='komoditas',
  color_discrete_sequence=px.colors.sequential.Aggrnyl_r,
  title="Volume Ekspor Hasil Perikanan (Ton) Tahun 2018")
fig.update_traces(textposition='outside', textinfo='percent+label+value')
fig.update_layout(showlegend=False)
fig.show()

#Color
# https://plotly.com/python/discrete-color/
# https://plotly.com/python/pie-charts/

# donut chart

import pandas as pd
import plotly.express as px

data_impor = pd.read_csv('2-pie & donut chart/data/impor perikanan.csv')
colors = ['gold', 'mediumturquoise', 'darkorange']

fig = px.pie(data_impor, values='volume_impor', names='komoditas', hole=0.5,
  title="Volume Ekspor Hasil Perikanan (Ton) Tahun 2018")
fig.update_traces(textposition='auto', textinfo='percent+label+value', 
                  marker=dict(colors=colors, line=dict(color='#000000', width=2)))
fig.update_layout(showlegend=False)
fig.show()

#Statistik Lingkungan Hidup Indonesia
# Air dan Lingkungan 2020

