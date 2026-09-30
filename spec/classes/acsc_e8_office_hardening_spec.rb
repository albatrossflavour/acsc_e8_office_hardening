# frozen_string_literal: true

require 'spec_helper'

describe 'acsc_e8_office_hardening' do
  localsids = { 'office_macro_local_sids' => [ 'Debian', 'ipaddress' ], 'office_macro_last_run' => 'macros_from_trusted_locations', 'office_macro_uptime' => 90 }

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts.merge!(localsids) }
      let(:params) { { 'trusted_locations' => { 'location1' => { 'path' => 'c:\\temp' } }, 'macro_setting' => 'clear_macro_settings' } }

      it { is_expected.to compile }

      # The fork's change: the strictest mode carries the two ML1 settings the
      # other restricting modes already set.
      context 'with all macros disabled' do
        let(:params) { { 'macro_setting' => 'all_macros_disabled' } }

        it { is_expected.to compile }

        ['excel', 'word', 'access', 'powerpoint', 'visio'].each do |app|
          it "blocks macros in files from the internet in #{app}" do
            is_expected.to contain_acsc_e8_office_hardening__user_registry_value(
              "software\\policies\\microsoft\\office\\16.0\\#{app}\\security\\blockcontentexecutionfrominternet",
            )
          end
        end

        it 'turns on macro antivirus scanning' do
          is_expected.to contain_acsc_e8_office_hardening__user_registry_value(
            'software\\policies\\microsoft\\office\\16.0\\common\\security\\macroruntimescanscope',
          )
        end
      end
    end
  end
end
