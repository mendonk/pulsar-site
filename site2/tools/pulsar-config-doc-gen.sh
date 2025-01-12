#!/usr/bin/env bash
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

ROOT_DIR=$(git rev-parse --show-toplevel)
DEST_DIR=$ROOT_DIR/generated-site
WEBSITE=$1
SITE_DIR=$DEST_DIR/reference
DOCS_DIR=$WEBSITE/docsify/config

JAVA=java
f=$ROOT_DIR/distribution/server/target/classpath.txt
GEN_DOCS_BROKER=org.apache.pulsar.utils.CmdGenerateDocumentation
GEN_DOCS_PROXY=org.apache.pulsar.proxy.util.CmdGenerateDocumentation

mkdir -p $SITE_DIR
mkdir -p $DOCS_DIR

cp $WEBSITE/docs/reference-configuration*.md $DOCS_DIR

$JAVA -cp `cat "${f}"` $GEN_DOCS_BROKER -c org.apache.pulsar.broker.ServiceConfiguration > $DOCS_DIR/reference-configuration-broker.md
$JAVA -cp `cat "${f}"` $GEN_DOCS_BROKER -c org.apache.pulsar.client.impl.conf.ClientConfigurationData > $DOCS_DIR/reference-configuration-client.md
$JAVA -cp `cat "${f}"` $GEN_DOCS_BROKER -c org.apache.pulsar.websocket.service.WebSocketProxyConfiguration > $DOCS_DIR/reference-configuration-websocket.md
$JAVA -cp `cat "${f}"` $GEN_DOCS_PROXY -c org.apache.pulsar.proxy.server.ProxyConfiguration > $DOCS_DIR/reference-configuration-pulsar-proxy.md

cp $DOCS_DIR/reference-configuration-broker.md $DOCS_DIR/reference-configuration-standalone.md

cp -r $WEBSITE/docsify/* $SITE_DIR
