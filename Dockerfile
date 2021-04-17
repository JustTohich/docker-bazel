FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-transport-https curl gnupg ca-certificates clang python3-pip valgrind python3-dev
RUN pip3 install pybadges setuptools
RUN curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > bazel.gpg
RUN mv bazel.gpg /etc/apt/trusted.gpg.d/
RUN echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list
RUN apt-get update && apt-get install -y --no-install-recommends bazel
RUN ln -s /usr/bin/python3 /usr/bin/python

