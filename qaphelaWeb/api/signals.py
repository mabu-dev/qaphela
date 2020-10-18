from django.core.signals import request_finished
from django.db.models.signals import post_save, post_delete
from django.dispatch import receiver
from api import models

from requests.exceptions import HTTPError
# from onesignalclient.app_client import OneSignalAppClient
# from onesignalclient.notification import Notification


@receiver(post_save, sender=models.FetchMeIncident)
def broadcastFetchMe(sender, **kwargs):
    target_object = kwargs['instance']
    # update_fields = kwargs['update_fields']
    incident = models.FetchMeIncident.objects.get(id=target_object.id)
    print(
        f"Victim: {incident.victim_full_names} \nLocation: {incident.pickup_address.address}")

    # if update_fields:
    #     status = target_object.status
    #     if status == 'accepted':
    #         pass
    # else:
    # '3f2a52ad-6c48-4333-bab3-cf0aa2420b94'
    # 'a072a9bd-853b-4389-a5e9-eb16d78f2a1a'
    # '06b22191-4a71-4cde-b19e-39e4cc3e883d'
    # player_id = 'a072a9bd-853b-4389-a5e9-eb16d78f2a1a'
    # app_id = 'eb92a654-370c-4374-865e-9793e5e21f65'
    # api_key = 'ZjZmNGRiZjctYzk1Zi00NmMzLTk4YjctMDdhZmQwMWZiY2Rj'
    # client = OneSignalAppClient(app_id=app_id, app_api_key=api_key)
    # notification = Notification(app_id, Notification.DEVICES_MODE)
    # print("Proceesing message")

    # notification.contents = {"en": 'symptoms: ' + str(target_object.symptoms)
    #                          + ', \nlocation: ' +
    #                          str(target_object.location.address)
    #                          + ', \nvisit_date_time: ' + str(target_object.visit_date_time)[:16]}

    # notification.include_player_ids = [player_id]
    # try:
    #     print("Trying to sent message")
    #     result = client.create_notification(notification)
    #     print('#### Message Sent.')
    # except Exception as e:
    #     result = e.response.json()
    #     print("Exception handled", result)
