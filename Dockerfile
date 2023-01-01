FROM python:3.10-bullseye

WORKDIR /app

ADD downloadpython.sh /app

RUN sh downloadpython.sh

RUN pip download pip setuptools setuptools-rust semantic-version typing-extensions rust wheel flit-core cython pywinrm pywinrm[kerberos] requests-kerberos pyvmoni paramiko ansible-pylibssh passlib netapp-lib ansible --no-binary=:all:

RUN pip install ansible

RUN ansible-galaxy collection download ansible.netcommon ansible.utils ansible.windows cisco.aci cisco.ios community.crypto community.docker community.general community.vmware community.windows check_point.mgmt netapp.ontap cyberark.pas cyberark.conjur kubernetes.core
