require 'cocoapods-core'

module Pod
  class Podfile

    module DSL

      def pod_ipub(name = nil, *requirements)
        pod(name, *requirements)
        current_target_definition.store_ipub(name)
      end

      def use_ipub(context = nil)
        unless context
          raise "method need call in post_install"
        end

        podfile = context.podfile
          @isFramework = false
          podfile.target_definition_list.each do |target_definition|
              if target_definition.uses_frameworks?
                  @isFramework = true
                  break
              end
          end
          return unless @isFramework

          @ipubFrameworks = []
          # context.umbrella_targets[0].specs.each do | spec|
          # puts "...ooo#{context.pod_targets}"
          context.pod_targets.each do | pod_target|
            # puts "...aaaa#{pod_target}"
              if pod_target.root_spec.is_ipub
                  @ipubFrameworks << pod_target.root_spec.name 
              end
          end
          return unless @ipubFrameworks.count != 0
          #spec.name
          
          puts "__1__#{@ipubFrameworks}"

          non_ipub_frameworks = 
          context.pods_project.targets.map do |target|
              if !target.name.include? "Pods-" and !@ipubFrameworks.include? target.name
                                      "${PODS_CONFIGURATION_BUILD_DIR}/#{target.name}"
              end
          end
          
          context.pods_project.targets.each do |target|
              if !target.name.include? "Pods-" and @ipubFrameworks.include? target.name
                  str = "$(inherited) "
                  str << non_ipub_frameworks.compact.join(" ")
                  str << " "
                  str << @ipubFrameworks.map { |item| item == target.name ? 
                      nil: "${PODS_CONFIGURATION_BUILD_DIR}/#{item}" }.compact.join(" ")
                  target.build_configurations.each do |config|
                      config.build_settings['FRAMEWORK_SEARCH_PATHS'] = str
                  end
                  puts "__2__#{target}"
              end
              target.build_configurations.each do |config|
                config.build_settings['CLANG_WARN_DOCUMENTATION_COMMENTS'] = 'NO'
                config.build_settings['CLANG_WARN_STRICT_PROTOTYPES'] = 'NO'
              end
          end
      end
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