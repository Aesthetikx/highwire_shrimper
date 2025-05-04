module HighwireShrimper
  module IRC
    module Commands
      # https://datatracker.ietf.org/doc/html/rfc2812#section-3.1.3
      class User
        attr_reader :user, :realname

        def initialize(user:, realname:)
          @user = user
          @realname = realname
        end

        def to_s
          "USER #{user} #{mode} #{unused} :#{realname}"
        end

        def mode = '0'

        def unused = '*'
      end
    end
  end
end
