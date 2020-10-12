from django.urls import path, include
from api import views as api_views

urlpatterns = [
    path('api/user/<int:pk>/', api_views.User.as_view()),
    path('api/get-abuser/<str:full_names>', api_views.Abuser.as_view()),
    path('api/case/<int:pk>/', api_views.Case.as_view()),
    path('api/abusers/', api_views.Abusers.as_view()),
    path('api/cases/', api_views.Cases.as_view()),
]
