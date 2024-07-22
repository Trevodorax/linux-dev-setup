FROM postgres:12

ENV POSTGRES_DB=weekly-news
ENV POSTGRES_USER=weekly
ENV POSTGRES_PASSWORD=AjE7ruewhrvYQ7avwbWqPoAB

COPY init.sql /docker-entrypoint-initdb.d/

RUN apt-get update && \
    apt-get install -y cron && \
    apt-get clean && \
    mkdir -p /opt/backup/postgresql

COPY start-backup-cron-job.sh /opt/backup/postgresql/start-backup-cron-job.sh
RUN chmod +x /opt/backup/postgresql/start-backup-cron-job.sh
RUN echo "4 2 */2 * * /opt/backup/postgresql/start-backup-cron-job.sh" >> /etc/crontab

EXPOSE 5432

CMD ["sh", "-c", "service cron start && docker-entrypoint.sh postgres"]
