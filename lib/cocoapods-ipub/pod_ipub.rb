require 'cocoapods-core'

module Pod
  class Podfile

    module DSL

      def pod_ipub(name = nil, *requirements)
        pod(name, *requirements)
      end

    end
  end
end