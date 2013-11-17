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
describe_recipe 'openldap::slave' do
  it 'inserts local schemas' do
    node['openldap']['local_schemas'].each do |s|
      file("#{node['openldap']['dir']}/slapd.conf").must_include s
    end
  end

  it 'creates indexes' do
    node['openldap']['indexes'].each do |i|
      file("#{node['openldap']['dir']}/slapd.conf").must_include i
    end
  end

  it 'sets the slapd master' do
    file("#{node['openldap']['dir']}/slapd.conf").must_include node['openldap']['slapd_master']
  end

  it 'sets the peers' do
    node['openldap']['peers'].each do |peer|
      if peer.start_with?('ip:')
        str = peer[3..-1]
      elsif peer.start_with?('ipv6:')
        str = peer[5..-1]
      end
      file("#{node['openldap']['dir']}/slapd.conf").must_include str
    end
  end

end
