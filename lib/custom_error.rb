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
      default:              100_100,   # 默认错误
      file:                 100_101,
      mongoid:              100_102
    },
    unauthorized:           100_020,   # admin为授权错误
    forbidden:              100_030,   # 操作没权限错误
    not_found:              {
      resource:             100_700 # 默认错误 资源不存在
    },
    internal_server_error:  100_050,   # 内部服务器错误
    bad_gateway:            100_060    # 网关错误
  }.freeze

  class << self
    def t(key, _option = {})
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
      @resource = resource || 'Resource'
      super("#{@resource} type error", :bad_request, @resource, ErrorCode[:bad_request][@resource.to_sym])
    end
  end

  class MongoidLegalError < BaseError
    def initialize
      super('Object id is invalid', :bad_request, 'MongoidLegalError', ErrorCode[:bad_request][:mongoid])
    end
  end
end
