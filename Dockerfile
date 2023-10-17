FROM ghcr.io/dbt-labs/dbt-snowflake:1.5.5
ENTRYPOINT [ "/bin/bash" ]

RUN apt-get update
RUN apt-get install git bash
RUN git clone https://github.com/winnu3103/dbt_aws_docker.git
WORKDIR "/root"
RUN mkdir .dbt

WORKDIR "/usr/app/dbt/dbt_docker_aws_proj"

RUN cp profiles/profiles.yml /root/.dbt/

# RUN pwd
COPY ./run_script.sh .

# RUN ./run_script.sh
CMD ["./run_script.sh"]