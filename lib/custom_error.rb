# encoding: utf-8

module CustomError

  StatusCode = {
    400 => :bad_request,
    401 => :unauthorized,
    403 => :forbidden,
    404 => :not_found,
    500 => :internal_server_error,
    502 => :bad_gateway
  }.freeze

  ErrorCode = {
    bad_request:            {
      default:              100100,   #默认错误
      file:                 100101
    },
    unauthorized:           100020,   #admin为授权错误
    forbidden:              100030,   #操作没权限错误
    not_found:              {
      resource:             100700,   #默认错误 资源不存在
    },
    internal_server_error:  100050,   #内部服务器错误
    bad_gateway:            100060    #网关错误
  }.freeze

  class << self

    def t(key, option = {})
      I18n.t(key.to_sym, { scope: 'errors.messages' }.merge(options))
    end
  end

  class BaseError < ::StandardError
    attr_reader :status, :resource, :field, :code

    def initialize(message = '', status = :bad_request, resource = nil, code = nil, field = nil)
      @status   = status
      @resource = resource
      @field    = field
      @code     = code
      super(message)
    end
  end

  class ResourceTypeError < BaseError

    def initialize(resource = nil)
      @resource = resource || "Resource"
      super("#{@resource} type error", :bad_request, @resource, ErrorCode[:bad_request][:resource_type])
    end
  end
end
