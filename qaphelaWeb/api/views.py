from api import serializers, models
from django.shortcuts import render
from rest_framework.permissions import AllowAny
from rest_framework import generics
from rest_framework.response import Response
from django.forms.models import model_to_dict


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
    queryset = models.Abuser.objects.all()


class CaseCheck(generics.ListCreateAPIView):
    # authentication_class = (JSONWebTokenAuthentication,)
    # permission_classes = (IsAuthenticated,)
    permission_classes = (AllowAny,)
    serializer_class = serializers.CaseSerializer

    def get_queryset(self):
        full_names = self.kwargs['full_names']
        return models.Case.objects.filter(
            perpetrators__full_names__icontains=full_names)


class Case(generics.RetrieveUpdateAPIView):
    # authentication_class = (JSONWebTokenAuthentication,)
    # permission_classes = (IsAuthenticated,)
    permission_classes = (AllowAny,)
    serializer_class = serializers.CaseSerializer
    queryset = models.Case.objects.all()


class FetchMeIncident(generics.RetrieveUpdateAPIView):
    # authentication_class = (JSONWebTokenAuthentication,)
    # permission_classes = (IsAuthenticated,)
    permission_classes = (AllowAny,)
    serializer_class = serializers.FetchMeSerializer
    queryset = models.FetchMeIncident.objects.all()


class FetchMeIncidents(generics.ListCreateAPIView):
    # authentication_class = (JSONWebTokenAuthentication,)
    # permission_classes = (IsAuthenticated,)
    permission_classes = (AllowAny,)
    serializer_class = serializers.FetchMeSerializer

    def get_queryset(self):
        queryset = models.FetchMeIncident.objects.all()
        return queryset

    def post(self, request, *args, **kwargs):
        validated_data = request.data
        print('********  ',validated_data)
        
        pickup_address = validated_data.pop('pickup_address')
        contact_details = validated_data.pop('contact_details')
        pickup_address = models.Address.objects.get_or_create(
            **pickup_address)[0]
        contact_details = models.ContactDetails.objects.get_or_create(
            **contact_details)[0]

        incident = models.FetchMeIncident.objects.create(
            pickup_address=pickup_address,
            contact_details=contact_details,
            **validated_data
        )
        incident = model_to_dict(incident)
        pickup_address = model_to_dict(pickup_address)
        pickup_address.pop("id")
        incident['pickup_address'] = pickup_address
        incident['contact_details'] = model_to_dict(contact_details)
        print("*" * 10)

        return Response(incident)


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
