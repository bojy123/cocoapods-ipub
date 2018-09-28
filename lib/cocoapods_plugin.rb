require 'cocoapods-ipub/pod_ipub'

Pod::HooksManager.register('cocoapods-ipub', :post_install) do |context, options|
    # /Users/tl/Desktop/HETPublicModuleSDK/HETPublicSDK_Core/Pods/Target Support Files
    # Pod::UI.message "哈哈哈哈#{context.sandbox.target_support_files_root}"
    podfile = Pod::Podfile.from_file("#{context.sandbox_root}/../Podfile")
    @isFramework = false
    podfile.target_definition_list.each do |target_definition|
        if target_definition.uses_frameworks?
            @isFramework = true
            break
        end
    end
    next unless @isFramework

    @ipubFrameworks = []
    context.umbrella_targets[0].specs.each do | spec|
        if spec.is_ipub
            @ipubFrameworks << spec 
        end
    end
    next unless @ipubFrameworks.count != 0
    #spec.name
    Pod::UI.message "...ooo#{@ipubFrameworks}"

    
    context.pods_project.targets.each do |target|
        if target.name.include? "Pods-"
            target.build_configurations.each do |config|
                Pod::UI.message "...哈哈#{config.build_settings}"
                break
            end
        end
    end

    context.pods_project.targets.each do |target|
        # Pod::UI.message "...哈哈总#{target.name}"
        target.build_configurations.each do |config|
            # AFNetworking.xcconfig
            # AFNetworking.xcconfig
            # Pod::UI.message "...哈哈#{config.base_configuration_reference.path}"
        end
    end
    
    # podfile = Pod::IPubPodfile.from_file("#{$projPath}/Podfile")
end
