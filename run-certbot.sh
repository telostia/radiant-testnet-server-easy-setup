echo "******** Starting Certbot **********"
source .env

FILE=.certbot
if test -f "$FILE"; then
    echo "$FILE exists. RUNNING RENEW CERTBOT"
    docker-compose -f docker-compose-LE.yml up
else
    echo "$FILE DOESNT exist, RUNNING CERTBOT 1ST BOOT"
    printf "certbot used" > .certbot
    docker-compose -f docker-compose-LE-1st.yml up
fi
