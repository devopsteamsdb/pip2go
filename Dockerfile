FROM python:bullseye

WORKDIR /app

RUN pip download pip --no-deps --no-binary=:all:

RUN pip download ansible

RUN pip install ansible

RUN ansible-galaxy collection download ansible.netcommon ansible.utils ansible.windows cisco.aci cisco.ios community.crypto community.docker community.general community.vmware community.windows check_point.mgmt netapp.ontap
