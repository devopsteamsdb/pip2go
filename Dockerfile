FROM python:3.10-bullseye

WORKDIR /app

ADD downloadpython.sh /app

RUN sh downloadpython.sh

RUN pip download pip setuptools wheel ansible ansible-core cffi cryptography jinja2 markupsafe packaging pycparser resolvelib pywinrm pywinrm[kerberos] requests-kerberos pyvmomi paramiko ansible-pylibssh passlib netapp-lib --platform  manylinux_2_17_x86_64 --only-binary=:all:

RUN pip download pyyaml --no-binary=:all:

RUN pip install ansible

RUN ansible-galaxy collection download ansible.netcommon ansible.utils ansible.windows cisco.aci cisco.ios community.crypto community.docker community.general community.vmware community.windows check_point.mgmt netapp.ontap cyberark.pas cyberark.conjur kubernetes.core
