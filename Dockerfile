FROM tsutomu7/python

RUN apt-get update --fix-missing && \
    apt-get install -y build-essential git libopencv-dev
    apt-get clean && \
    cd /opt && \
    git clone --recursive https://github.com/dmlc/mxnet && \
    cd mxnet && \
    make -j4 && \
    conda install numpy && \
    xs python && \
    python setup.py install && \
    rm -rf /var/lib/apt/lists/*
CMD ["bash"]
