require 'cocoapods-core'

module Pod
  class Podfile

    module DSL

      def pod_ipub(name = nil, *requirements)
        r = requirements
        r.push(:ipub => true)
        pod(name, r)
      end

    end
  end


  class Dependency
    def is_ipub?
      if external_source
        external_source[:ipub]
      end
    end
  end

end