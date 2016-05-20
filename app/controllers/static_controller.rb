class StaticController < ApplicationController
  require "braintree"

  def home
  end

  def onetime
    @token = Braintree::ClientToken.generate
  end

  def recurring
    @token = Braintree::ClientToken.generate
  end

  def subscription
    @token = Braintree::ClientToken.generate
  end
end
