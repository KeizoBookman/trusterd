root_dir = "/usr/local/trusterd"

s = HTTP2::Server.new({

  :port           => 8080,
  #:key            => "#{root_dir}/ssl/server.key",
  #:crt            => "#{root_dir}/ssl/server.crt",
  :document_root  => "#{root_dir}/htdocs",
  :server_name    => "mruby-http2 server",

  #
  # optional config
  #

  # debug default: false
  # :debug  =>  true,

  # tls default: true
  :tls => false,

  # damone default: false
  # :daemon => true,

  # callback default: false
  # :callback => true,

  # connection record default: true
  # :connection_record => false,
})

#
# when :callback option is true,
#
# s.set_map_to_strage_cb {
#
#   p "callback bloack at set_map_to_strage_cb"
#   p s.request.uri
#   p s.request.filename
#
#   # location setting
#   if s.request.uri == "/index.html"
#     s.request.filename = "#{root_dir}/htdocs/hoge"
#   end
#   p s.request.filename
#
#   # you can use regexp if you link regexp mrbgem.
#   # Or, you can use KVS like mruby-redis or mruby-
#   # vedis and so on.
#
# }

#
# f = File.open "#{root_dir}/logs/access.log", "a"
#
# s.set_logging_cb {
#
#   p "callback block after send response"
#   f.write "#{s.conn.client_ip} #{Time.now} - #{s.r.uri} - #{s.r.filename}\n"
#
# }

s.run

