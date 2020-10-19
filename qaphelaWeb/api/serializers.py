
from rest_framework import serializers
from api import models
from django.contrib.auth.models import User
from django.contrib.auth import get_user_model
from django.forms.models import model_to_dict


class DynamicModelSerializer(serializers.ModelSerializer):
    """
    A ModelSerializer that takes an additional `fields` argument that
    controls which fields should be displayed.
    """

    def get_field_names(self, declared_fields, info):
        field_names = super(DynamicModelSerializer, self).get_field_names(
            declared_fields, info)
        if self.dynamic_fields is not None:
            # Drop any fields that are not specified in the `fields` argument.
            allowed = set(self.dynamic_fields)
            excluded_field_names = set(field_names) - allowed
            field_names = tuple(
                x for x in field_names if x not in excluded_field_names)
        return field_names

    def __init__(self, *args, **kwargs):
        # Don't pass the 'fields' or 'read_only_fields' arg up to the superclass
        self.dynamic_fields = kwargs.pop('fields', None)
        self.read_only_fields = kwargs.pop('read_only_fields', [])

        # Instantiate the superclass normally
        super(DynamicModelSerializer, self).__init__(*args, **kwargs)


class UserSerializer(DynamicModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'first_name', 'last_name', 'email']

    @staticmethod
    def get_basic_fields():
        return 'id', 'first_name', 'last_name'


class ContactDetailsSerializer(DynamicModelSerializer):
    class Meta:
        model = models.ContactDetails
        fields = '__all__'

    @staticmethod
    def get_basic_fields():
        return 'primary_contact_number', 'next_of_kin_firstname',
        'next_of_kin_lastname', 'next_of_kin_primary_contact_number'

    @staticmethod
    def get_practice_details():
        return 'primary_contact_number', 'secondary_contact_number'


class AddressSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = models.Address
        fields = ['address', 'city', 'country',
                  'lattitude', 'longitude', 'postal_code', 'province',
                  'street_name', 'street_number', 'suburb']


class SocialProfilesSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.SocialProfiles
        fields = '__all__'


class QaphelaUserSerializer(DynamicModelSerializer):
    user = UserSerializer()
    address = AddressSerializer()
    contact_details = ContactDetailsSerializer()
    social_profiles = SocialProfilesSerializer()

    class Meta:
        model = models.QaphelaUser
        fields = ['user', 'user_type', 'imageurl', 'is_dispatch_user',
                  'social_profiles', 'contact_details', 'address']
        read_only_fields = ('username', )

    def get_address(self, instance):
        return model_to_dict(models.Address.objects.get(user=instance.user))

    def get_contact_details(self, instance):
        return model_to_dict(models.ContactDetails.objects.get(user=instance.user))


class AbuserSerializer(DynamicModelSerializer):
    contact_details = ContactDetailsSerializer(required=False)
    social_profiles = SocialProfilesSerializer(required=False)

    class Meta:
        model = models.Abuser
        fields = ['full_names', 'imageurl', 'workplace_details',
                  'contact_details', 'social_profiles']

    def get_contact_details(self, instance):
        return model_to_dict(models.ContactDetails.objects.get(user=instance.user))


class CaseSerializer(serializers.ModelSerializer):
    reporter = QaphelaUserSerializer()
    # perpetrators = AbuserSerializer(many=True)
    perpetrators = AbuserSerializer()

    class Meta:
        model = models.Case
        fields = '__all__'


class FetchMeSerializer(serializers.ModelSerializer):
    responders = QaphelaUserSerializer(many=True, required=False)
    pickup_address = AddressSerializer()
    contact_details = ContactDetailsSerializer()

    class Meta:
        model = models.FetchMeIncident
        fields = '__all__'
