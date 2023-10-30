# Use an official Ubuntu image as the base image
FROM ghcr.io/dbt-labs/dbt-snowflake:1.5.5
ENTRYPOINT [ "/bin/bash" ]

# Minimize the number of layers and apt-get commands
RUN apt-get update && \
    apt-get -y install git bash && \
    git clone https://github.com/winnu3103/dbt_aws_docker.git && \
    mkdir /root/.dbt && \
    cp /usr/app/dbt/aws_to_swnoflake_dbt_repo/profiles/profiles.yml /root/.dbt/

# Set the working directory and copy the script
WORKDIR /usr/app/dbt/aws_to_swnoflake_dbt_repo
COPY ./run_script.sh .

CMD ["./run_script.sh"]