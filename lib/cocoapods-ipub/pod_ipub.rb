require 'cocoapods-core'

module Pod
  class Podfile

    module DSL

      def pod_ipub(name = nil, *requirements)
        pod(name, *requirements)
        current_target_definition.store_ipub(name)
      end

    end
  end


  class Dependency
    attr_accessor :is_ipub = false
  end

  class TargetDefinition
    # @return [Array<String>] 
    attr_accessor :ipub_dependency_names

    def store_ipub(name)
      @ipub_dependency_names << name
    end
    
    def ipub_dependencies
      dependencies.map do |dependency|
        if @ipub_dependency_names.include?(dependency.name)
          dependency.is_ipub = true
        end
      end
    end
    
  end

end