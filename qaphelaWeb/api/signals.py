from django.core.signals import request_finished
from django.db.models.signals import post_save, post_delete
from django.dispatch import receiver
from api import models
import os
from requests.exceptions import HTTPError
from django.core.mail import EmailMultiAlternatives, get_connection, send_mail
# from onesignalclient.app_client import OneSignalAppClient
# from onesignalclient.notification import Notification


def send_mass_html_mail(datatuple, fail_silently=False, user="support@jmbonline.co.za",
                        password='Supp0rt@Jmb!', connection=None):
    """
    Given a datatuple of (subject, text_content, html_content, from_email,
    recipient_list), sends each message to each recipient list. Returns the
    number of emails sent.

    If from_email is None, the DEFAULT_FROM_EMAIL setting is used.
    If auth_user and auth_password are set, they're used to log in.
    If auth_user is None, the EMAIL_HOST_USER setting is used.
    If auth_password is None, the EMAIL_HOST_PASSWORD setting is used.

    """
    # connection = connection or get_connection(
    #     username=user, password=password, fail_silently=fail_silently)
    # os.system(
    #     f'say "The Email Connection is {connection}"')
    # messages = []
    # for subject, html, from_email, recipient in datatuple:
    #     message = EmailMultiAlternatives(subject, html, from_email, recipient)
    #     message.attach_alternative(html, 'text/html')
    #     messages.append(message)
    # return connection.send_messages(messages)

    for subject, html, from_email, recipient in datatuple:
        status = send_mail(subject, "Hello", from_email,
                           recipient, fail_silently=fail_silently)
        # os.system(
        #     f'say "Sent email to {recipient[0]}, status is {status}"')


def send_fetchme_emails(incident):
    """
    Send email to Dispatch Users.
    """
    subject = 'Qaphela: FetchMe Incident'
    from_email = 'fetchme@qaphela.com'
    current_site = "qaphela.com"  # Site.objects.get_current()
    link_message = f"See details on this link https://{current_site}"
    messages = []

    for user in models.QaphelaUser.objects.filter(is_dispatch_user=True):
        message = """
        <html>
            <head>
                <style>
                    table {{
                        border-collapse: collapse;
                        width: 100%;
                    }}
                    th, td {{
                        text-align: left;
                        padding: 8px;
                    }}
                    tr{{
                        background-color: #f2f2f2
                    }}
                    th {{
                        background-color: #006DF0;
                        color: white;
                    }}
                </style>
            </head>
            <body>
                Dear {name}, this is a notfication of a FetchMe incident on Qaphela. 
                <br>See details below:
                <br><br>
                <table>
                    <tr>
                        <th>Who</th>
                        <th>When</th>
                        <th>Reported</th>
                        <th>Where</th>
                        <th>GPS</th>
                    </tr>
                    <tr>
                        <td>{victim}</td>
                        <td>{fetch_me_type}</td>
                        <td>{fetch_me_datetime}</td>
                        <td>{fetch_me_address}</td>
                        <td>{fetch_me_gps}</td>
                    </tr>
                </table>
                <br><br>
                Kind Regards, <br>
                Qaphela Team
            </body>
        </html>
        """.format(
            name=user.user.first_name,
            victim=incident.victim_full_names,
            fetch_me_type=incident.incident_type,
            fetch_me_datetime=str(incident.pickup_time),
            fetch_me_address=incident.pickup_address.address,
            fetch_me_gps=f"LON: {incident.pickup_address.longitude}, LAT: {incident.pickup_address.lattitude}")
        messages.append((subject, message, from_email, [user.user.email]))

    send_mass_html_mail(messages)


@receiver(post_save, sender=models.FetchMeIncident)
def broadcastFetchMe(sender, **kwargs):
    target_object = kwargs['instance']
    # update_fields = kwargs['update_fields']
    incident = models.FetchMeIncident.objects.get(id=target_object.id)

    # os.system(
    #     f'say "Sending Fetch Me Emails"')
    # f'say "Fetch Me Incident for {incident.victim_full_names}"')

    # print(
    #     f"Victim: {incident.victim_full_names} \nLocation: {incident.pickup_address.address}")
    send_fetchme_emails(incident)
    # os.system(
    #     f'say "Email Status, {ml}"')

    # os.system(
    #     f'say "Fetch Me Incident for {incident.victim_full_names}"')

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
