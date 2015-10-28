# encoding: UTF-8
require 'net/http'
require 'uri'

module Zenvia
  module Base
    ZENVIA_URL = 'http://www.zenvia360.com.br/GatewayIntegration/msgSms.do'

    private

    def send_to_zenvia(id_sms, msg, cel_phone)
      Net::HTTP.post_form URI(ZENVIA_URL),
        {
          :account  => Zenvia.configuration.account,
          :code     => Zenvia.configuration.code,
          :dispatch => Zenvia.configuration.dispatch,
          :from     => Zenvia.configuration.from,
          :id       => id_sms,
          :to       => cel_phone,
          :msg      => msg
        }
    end
  end
end