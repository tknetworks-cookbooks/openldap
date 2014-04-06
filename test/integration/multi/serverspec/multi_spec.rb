#
# Author:: TANABE Ken-ichi (<nabeken@tknetworks.org>)
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
require 'spec_helper'

describe 'openldap::multi' do
  describe file("/etc/ldap/slapd.conf") do
    [
      "overlay syncprov",
      "serverID 100",
      "mirrormode on",
      "syncprov-checkpoint 100 10",
      "syncprov-sessionlog 100",
      "syncrepl rid=0000",
      "provider=ldaps://ldap.example.com",
    ].each do |l|
      its(:content) {
        should include l
      }
    end
  end
end
