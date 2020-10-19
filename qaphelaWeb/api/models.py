from django.db import models
from django.core.validators import URLValidator
from django.contrib.auth.models import User
import uuid


class Address(models.Model):
    address = models.TextField(null=True)
    city = models.CharField(max_length=100, null=True)
    country = models.CharField(max_length=100, null=True)
    lattitude = models.CharField(max_length=20)
    longitude = models.CharField(max_length=20)
    postal_code = models.CharField(max_length=100, null=True)
    province = models.CharField(max_length=100, null=True)
    street_name = models.CharField(max_length=100, null=True)
    street_number = models.CharField(max_length=100, null=True)
    suburb = models.CharField(max_length=100)


class SocialProfiles(models.Model):
    name = models.CharField(max_length=100, null=True)
    profile_page = models.TextField(
        validators=[URLValidator()], null=True)


class ContactDetails(models.Model):
    primary_contact_number = models.CharField(
        max_length=100)
    secondary_contact_number = models.CharField(
        max_length=100, null=True)
    next_of_kin_firstname = models.CharField(
        max_length=100, null=True)
    next_of_kin_lastname = models.CharField(
        max_length=100, null=True)
    next_of_kin_primary_contact_number = models.CharField(
        max_length=15, null=True)
    next_of_kin_secondary_contact_number = models.CharField(
        max_length=15, null=True)


class QaphelaUser(models.Model):
    USER_TYPES = [("STANDARD", "STANDARD"), ("LEGAL", "LEGAL")]
    user = models.OneToOneField(
        User, on_delete=models.CASCADE, primary_key=True)
    user_type = models.CharField(
        max_length=15,
        choices=USER_TYPES)
    imageurl = models.TextField(
        validators=[URLValidator()], null=True)
    is_dispatch_user = models.BooleanField(default=False)
    social_profiles = models.ForeignKey(
        SocialProfiles, on_delete=models.CASCADE, null=True)
    contact_details = models.ForeignKey(
        ContactDetails, on_delete=models.CASCADE)
    address = models.ForeignKey(
        Address, on_delete=models.CASCADE)


class Abuser(models.Model):
    full_names = models.CharField(max_length=100)
    imageurl = models.TextField(
        validators=[URLValidator()], null=True)
    workplace_details = models.TextField(null=True)
    contact_details = models.ForeignKey(
        ContactDetails, on_delete=models.CASCADE, null=True)
    social_profiles = models.ForeignKey(
        SocialProfiles, on_delete=models.CASCADE, null=True)


class Case(models.Model):
    OCCASIONS = [("HOME", "HOME"), ("WORK", "WORK"),
                 ("CHURCH", "CHURCH"), ("EVENT", "EVENT"), ("OTHER", "OTHER")]
    REPORT_TYPES = [("ACCUSATION", "ACCUSATION"), ("REPORT",
                                                   "REPORT"), ("ALLEGATION", "ALLEGATION")]
    CASE_STATUS = [("VERIFIED", "VERIFIED"), ("UNVERIFIED", "UNVERIFIED")]
    SETTLEMENT_TYPE = [("IN COURT", "IN COURT"),
                       ("OUT OF COURT", "OUT OF COURT")]
    title = models.CharField(max_length=100)
    report_type = models.CharField(max_length=15, choices=REPORT_TYPES)
    occasion = models.CharField(max_length=15, choices=OCCASIONS)
    preview = models.TextField()
    when = models.DateTimeField()
    perpetrators = models.ForeignKey(Abuser, on_delete=models.CASCADE)
    reporter = models.ForeignKey(
        QaphelaUser, on_delete=models.CASCADE)
    frequency = models.IntegerField()
    date_reported = models.DateTimeField(auto_now_add=True)
    case_status = models.CharField(max_length=15, choices=CASE_STATUS)
    settlement_type = models.CharField(
        max_length=15, choices=SETTLEMENT_TYPE, null=True)
    police_case_number = models.CharField(max_length=100, null=True)
    reference_url = models.TextField(
        validators=[URLValidator()], null=True)


class FetchMeIncident(models.Model):
    INCIDENT_TYPES = [("NOW", "NOW"), ("SCHEDULED", "SCHEDULED")]
    STATUS = [("WAITING", "WAITING"), ("OPEN", "OPEN"), ("CLOSED", "CLOSED"),
              ("CANCELLED", "CANCELLED")]
    incident_type = models.CharField(
        max_length=10, choices=INCIDENT_TYPES)
    incident_status = models.CharField(
        max_length=10, choices=STATUS, default="WAITING")
    pickup_address = models.ForeignKey(
        Address, on_delete=models.CASCADE)
    pickup_time = models.DateTimeField()
    victim_full_names = models.CharField(max_length=100)
    contact_details = models.ForeignKey(
        ContactDetails, on_delete=models.CASCADE)
    responders = models.ManyToManyField(QaphelaUser)
