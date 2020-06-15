FROM sonarqube:7.9.3-community

ARG BSL_PLUGIN_VERSION=1.6.0

ENV PLUGIN=https://github.com/1c-syntax/sonar-bsl-plugin-community/releases/download/v${BSL_PLUGIN_VERSION}/sonar-communitybsl-plugin-${BSL_PLUGIN_VERSION}.jar \
    PLUGIN_NAME=sonar-communitybsl-plugin-${BSL_PLUGIN_VERSION}.jar	 

USER root
RUN apt-get -y update \
	&& cd /opt/sonarqube/ \
	&& curl -o "$PLUGIN_NAME" -fsSL "$PLUGIN" \
	&& mv -f "$PLUGIN_NAME" extensions/plugins/

USER sonarqube