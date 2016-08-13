from crontab import CronTab
from datetime import datetime
from faker import Factory

def generate_a_cron(appointments):
    cron = CronTab(user=True)
    for appointment_date in appointments:
        fake = Factory.create()
        random_time = fake.date_time(tzinfo=None)

        appointment_datetime = datetime.strptime(appointment_date, '%d/%m/%Y')
        utc_year = appointment_datetime.year - 543
        formatted_date = appointment_datetime.replace(
            hour=random_time.hour,
            minute=random_time.minute,
            year=utc_year
        )

        cron.new(
            command='python3 /opt/my_script.py'
        ).setall(formatted_date)

    cron.write('cron_empui')
