FROM python:3.10-bullseye

WORKDIR /app

ADD downloadpython.sh /app

RUN sh downloadpython.sh

RUN pip download ansible ansible-core ansible-pylibssh bcrypt certifi cffi chardet cryptography docker idna jinja2 jmespath lxml markupsafe netapp-lib ntlm-auth packaging paramiko passlib pip pycparser pykerberos pynacl pyparsing pyvmomi pywinrm pyyaml requests requests-kerberos requests-ntlm resolvelib setuptools six urllib3 websocket-client xmljson xmltodict --no-binary=:all:

RUN pip install ansible

RUN ansible-galaxy collection download ansible.netcommon ansible.utils ansible.windows cisco.aci cisco.ios community.crypto community.docker community.general community.vmware community.windows check_point.mgmt netapp.ontap cyberark.pas cyberark.conjur kubernetes.core
