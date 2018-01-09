class ApplicationController < ActionController::API
  include ErrorHandler::VerifyHelper
  include ErrorHandler::RenderHelper
  rescue_from ::CustomError::ResourceTypeError,         with: :render_with_exception

end
