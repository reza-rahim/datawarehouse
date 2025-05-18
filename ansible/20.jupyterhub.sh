source 00.evn.sh
ansible-playbook -i inventory.ini \
-e fqdn=$FQDN \
-e keycloak_jupyter_client_id=$KEYCLOAK_JUPYTER_CLIENT_ID \
-e keycloak_jupyter_client_secret=$KEYCLOAK_JUPYTER_CLIENT_SECRET \
-e jupyterhub=$JUPYTERHUB \
-e jupyterlab=$JUPYTERLAB \
-e notebook=$NOTEBOOK \
-e sqlalchemy=$SQLALCHEMY \
-e statsmodels=$STATSMODELS \
-e scikit_learn=$SCIKIT_LEARN \
-e scikit_image=$SCIKIT_IMAGE \
-e pandas=$PANDAS \
-e numpy=$NUMPY \
-e matplotlib=$MATPLOTLIB \
-e seaborn=$SEABORN \
-e plotly=$PLOTLY \
-e torch=$TORCH \
-e oauthenticator=$OAUTHENTICATOR \
jupyterhub.yaml
