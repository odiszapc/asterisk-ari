#------------------------------------------------------------------------------
#
#  WARNING !
#
#  This is a generated file. DO NOT EDIT THIS FILE! Your changes will
#  be lost the next time this file is regenerated.
#
#  This file was generated using asterisk-ari-client ruby gem.
#
#------------------------------------------------------------------------------

module Ari
  class PeerStatusChange < Event

    attr_reader :endpoint, :peer

    def endpoint=(val)
      @endpoint ||= Endpoint.new(val)
    end

    def peer=(val)
      @peer ||= Peer.new(val)
    end


  end
end