FROM giangiangian/che_nvidia_python
RUN pip install jupyter

COPY ["entrypoint.sh","/home/user/entrypoint.sh"]
RUN sudo chmod a+x /home/user/entrypoint.sh

RUN mkdir -p /home/user/.jupyter
COPY ["jupyter_notebook_config.json","/home/user/.jupyter/jupyter_notebook_config.json"]
COPY ["jupyter_notebook_config.py","/home/user/.jupyter/jupyter_notebook_config.py"]

# Install other python libraries that are required for our projects (yeah, this is not the right place to add these lines)
COPY requirements.txt
RUN pip install --upgrade pip && pip install -r requirements.txt

ENTRYPOINT ["/home/user/entrypoint.sh"]
CMD tail -f /dev/null