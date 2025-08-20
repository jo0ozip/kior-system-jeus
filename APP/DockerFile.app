FROM kior-system-jeus85:latest

COPY --chown=kior:kior app.war ${JEUS_HOME}/domains/${DOMAIN_NAME}/auto-deploy/app.war
