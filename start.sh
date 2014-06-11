# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

sed -r -i "s/(set\s+\:bind,\s+)\"(.*)\"/\1\"$HOST\"/g" /opt/config.rb
sed -r -i "s/(\"server\"\:\s+)\"(.*)\:/\1\"$HOST\:/g" /opt/dash-config.json

IP=$(ifconfig  | grep 'inet addr:'| grep 17 | grep 172|cut -d: -f2 | awk '{ print $1}')
sed -r -i "s/(\[host\s+)\"(.*)\"/\1\"$IP\"/g" /opt/riemann.config 

$RIEMANN_HOME/bin/riemann /opt/riemann.config &
riemann-dash /opt/config.rb
