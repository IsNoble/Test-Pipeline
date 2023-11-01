from django.urls import path
from Hello_World_Tester import views

urlpatterns = [
    path('', views.Hello_World_Tester, name='hello_world'),
]