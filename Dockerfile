FROM python:2.7
RUN apt-get update && apt-get install -y wget
RUN wget https://swift.org/builds/ubuntu1404/swift-2.2-SNAPSHOT-2015-12-01-b/swift-2.2-SNAPSHOT-2015-12-01-b-ubuntu14.04.tar.gz
RUN wget https://swift.org/builds/ubuntu1404/swift-2.2-SNAPSHOT-2015-12-01-b/swift-2.2-SNAPSHOT-2015-12-01-b-ubuntu14.04.tar.gz.sig
RUN wget -q -O - https://swift.org/keys/all-keys.asc | gpg --import - # Download GPG keys from swift org
RUN gpg --keyserver hkp://pool.sks-keyservers.net --refresh-keys Swift # Ensure no revocations
RUN gpg --verify swift-2.2-SNAPSHOT-2015-12-01-b-ubuntu14.04.tar.gz.sig
RUN apt-get install -y clang
RUN tar xzf swift-2.2-SNAPSHOT-2015-12-01-b-ubuntu14.04.tar.gz --directory / --strip-components=1
RUN echo "print(\"hello world\")" > main.swift
RUN swift main.swift

