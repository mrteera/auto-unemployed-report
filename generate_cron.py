from crontab import CronTab
from datetime import datetime
from faker import Factory

def generate_a_cron(appointment_date):
    fake = Factory.create()
    random_time = fake.date_time(tzinfo=None)
    a_appointment_date = datetime.strptime(appointment_date, '%d/%m/%Y')
    new_year = a_appointment_date.year - 543
    new_date = a_appointment_date.replace(
        hour=random_time.hour,
        minute=random_time.minute,
        year=new_year
    )
    cron = CronTab(user=True)

    job = cron.new(command='python3 /opt/my_script.py')
    job.setall(new_date)

    cron.write('cron_test')
