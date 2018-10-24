FROM giangiangian/che_nvidia_python
RUN pip3 install jupyter

COPY ["entrypoint.sh","/home/user/entrypoint.sh"]
RUN sudo chmod a+x /home/user/entrypoint.sh
ENTRYPOINT ["/home/user/entrypoint.sh"]
CMD tail -f /dev/null