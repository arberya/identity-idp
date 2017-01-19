module Idv
  class FinancialsValidator < VendorValidator
    private

    def result
      @_result ||= idv_agent.submit_financials(vendor_params, session_id)
    end

    def session_id
      idv_session.resolution.session_id
    end
  end
end