# Copyright (c) 2005 David Heinemeier Hansson
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
module AccountLocation
  def self.included(controller)
    controller.helper_method(:account_domain, :account_subdomain, :account_host, :account_url)
  end

  protected
    def default_account_subdomain
      @account.username if @account && @account.respond_to?(:username)
    end
  
    def account_url(account_subdomain = default_account_subdomain, use_ssl = request.ssl?)
      (use_ssl ? "https://" : "http://") + account_host(account_subdomain)
    end

    def account_host(account_subdomain = default_account_subdomain)
      account_host = ""
      account_host << account_subdomain + "."
      account_host << account_domain
    end

    def account_domain
      account_domain = ""
      account_domain << request.subdomains[1..-1].join(".") + "." if request.subdomains.size > 1
      account_domain << request.domain + request.port_string
    end
    
    def account_subdomain
      request.subdomains.first
    end
end