from django.urls import path

from . import views

app_name = 'cars'

urlpatterns = [
    path('hello/', views.hello, name='hello'),
    path('', views.cars, name='cars_list'),
]
