FROM python:3.8-bullseye

RUN pip install mako pyyaml ushlex jsonxs

COPY src/ /app

RUN groupadd -r -g 1000 app && \
    useradd -r -u 1000 -g app -d /app app && \
    chown -R app:app /app

USER app
WORKDIR /data

ENTRYPOINT ["python", "/app/ansible-cmdb.py"]
# docker run -it -v $(pwd):/data -u $(id -u):$(id -g) ansible-cmdb
