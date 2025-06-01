#!/bin/bash

## check the mount mount, if exists then exit
/usr/bin/df {{ airflow_dag_dir }} |/usr/bin/grep s3fs

if [ $? -eq 0 ] 
then 
  /usr/bin/echo "already mounted"	
  exit 0
fi

## mount s3 bucket wuth fuse

/usr/bin/echo "Mounting ..."	
#/etc/lockbox/decrypt_lockbox.sh 

eval "$({{ secret_dir }}/{{ decrypt_file }})";
AWSACCESSKEYID=$AWS_ACCESS_KEY_ID
AWSSECRETACCESSKEY=$AWS_SECRET_ACCESS_KEY

group="$(/usr/bin/getent group {{ fuse_group }}  | /usr/bin/cut -d: -f3)"
mkdir -p {{ airflow_dag_dir }} 
mkdir -p {{ airflow_log_dir }}

/usr/bin/s3fs {{ airflow_s3_bucket_dag }} {{ airflow_dag_dir }} -o umask=002,gid=$group,use_path_request_style,allow_other,url={{ s3_protocol }}://minio.{{ fqdn }}:9000
/usr/bin/s3fs {{ airflow_s3_bucket_log }} {{ airflow_log_dir }} -o umask=002,gid=$group,use_path_request_style,allow_other,url={{ s3_protocol }}://minio.{{ fqdn }}:9000
