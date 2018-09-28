require 'cocoapods-core'

module Pod
  class Podfile

    module DSL

      def pod_ipub(name = nil, *requirements)
        pod(name, *requirements)
        current_target_definition.store_ipub(name)
      end

      # def use_frameworks_ipub!(flag = true)
      #   current_target_definition.is_frameworks_ipub = true
      #   current_target_definition.use_frameworks!(flag)
      # end
    end

    class TargetDefinition
      # @return [Array<String>] 
      attr_accessor :ipub_dependency_names
      
      # attr_accessor :is_frameworks_ipub
  
      def store_ipub(name)
        @ipub_dependency_names ||= []
        @ipub_dependency_names << name
      end
      
      def ipub_dependencies
        @ipub_dependency_names ||= []
        dependencies.map do |dependency|
          if @ipub_dependency_names.include?(dependency.name)
            dependency.is_ipub = true
          end
          dependency
        end
      end
      
    end
    
  end

  class IPubPodfile < Pod::Podfile
  end
  class Dependency
    attr_accessor :is_ipub
  end

  class Specification

    module DSL
      attr_accessor :is_ipub
    end
  end

  

end