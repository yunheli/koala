# encoding: utf-8

module ErrorHandler

  module VerifyHelper

    def verify_mongoid_format
      # params.select { |k, v| k =~ /id\z/i }.each do |id, value|
      #   next if ID_WHITE_LIST.include?(id.to_s)
      #   unless BSON::ObjectId.legal?(value)
      #     raise CustomError::MongoidLegalError
      #   end
      # end
    end


  end

  module RenderHelper

    def render_with_exception exception
      p exception.to_s
      render_with_errors(exception.message, exception.status, exception.code )
    end

    def render_with_errors errors_info, status = 200, code = CustomError::ErrorCode[:bad_request][:parameter]
      render json: { errors: errors_info.as_json(full_messages: true), code: code }, status: status
    end
  end
end
