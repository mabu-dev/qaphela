from django.urls import path, include
from api import views as api_views

urlpatterns = [
    path('api/user/<int:pk>/', api_views.User.as_view()),
    path('api/case-check/<str:full_names>/', api_views.CaseCheck.as_view()),
    path('api/fetchme/<int:pk>/', api_views.FetchMe.as_view()),
    path('api/abuser/<int:pk>/', api_views.Abuser.as_view()),
    path('api/case/<int:pk>/', api_views.Case.as_view()),
    path('api/abusers/', api_views.Abusers.as_view()),
    path('api/cases/', api_views.Cases.as_view()),
]
