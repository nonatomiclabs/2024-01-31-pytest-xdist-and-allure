FROM python:3.12-slim
RUN apt update
RUN apt install -y wget
RUN wget -O /tmp/allure.deb https://github.com/allure-framework/allure2/releases/download/2.26.0/allure_2.26.0-1_all.deb
RUN apt --fix-broken install -y /tmp/allure.deb
WORKDIR /home
COPY requirements-frozen.txt /home
RUN pip install -r requirements-frozen.txt
COPY entrypoint.sh /home
COPY tests/ /home/tests/
ENV PYTEST_XDIST_AUTO_NUM_WORKERS=0
ENTRYPOINT [ "/home/entrypoint.sh" ]
