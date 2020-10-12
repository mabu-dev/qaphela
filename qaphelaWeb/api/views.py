from api import serializers, models
from django.shortcuts import render
from rest_framework.permissions import AllowAny
from rest_framework import generics


class User(generics.RetrieveUpdateAPIView):
    serializer_class = serializers.QaphelaUserSerializer
    # authentication_class = (JSONWebTokenAuthentication,)
    # permission_classes = (IsAuthenticated,)
    permission_classes = (AllowAny,)
    queryset = models.QaphelaUser.objects.all()


class Abuser(generics.ListCreateAPIView):
    # authentication_class = (JSONWebTokenAuthentication,)
    # permission_classes = (IsAuthenticated,)
    permission_classes = (AllowAny,)
    serializer_class = serializers.AbuserSerializer

    def get_queryset(self):
        full_names = self.kwargs['full_names']
        return models.Abuser.objects.filter(full_names__icontains=full_names)


class Case(generics.RetrieveUpdateAPIView):
    # authentication_class = (JSONWebTokenAuthentication,)
    # permission_classes = (IsAuthenticated,)
    permission_classes = (AllowAny,)
    serializer_class = serializers.CaseSerializer
    queryset = models.Case.objects.all()


class Abusers(generics.ListCreateAPIView):
    # authentication_class = (JSONWebTokenAuthentication,)
    # permission_classes = (IsAuthenticated,)
    permission_classes = (AllowAny,)
    serializer_class = serializers.AbuserSerializer

    def get_queryset(self):
        return models.Abuser.objects.all()


class Cases(generics.ListCreateAPIView):
    # authentication_class = (JSONWebTokenAuthentication,)
    # permission_classes = (IsAuthenticated,)
    permission_classes = (AllowAny,)
    serializer_class = serializers.CaseSerializer
    queryset = models.Case.objects.all()
