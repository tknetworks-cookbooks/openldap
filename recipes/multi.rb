#
# Author:: Ken-ichi TANABE (<nabeken@tknetworks.org>)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

node.default['openldap']['slapd_type'] = 'multi'

if node['openldap']['server_id'] < 1
  raise ArgumentError, "server_id should be configured in multi-master mode."
end

include_recipe "openldap::server"
include_recipe "openldap::_slave"
include_recipe "openldap::server"
