#!/usr/bin/env ruby

require 'xcodeproj'

IOS_VERSION = 9.3

project_name = ARGV[0]

target_directories = Dir['*/'].select do |sub_directory|
  sub_directory.index(project_name) == 0
end

p target_directories

project = Xcodeproj::Project.new(project_name);

#lib_path = "WatchDetector/";

# Add the lib file as a reference
#libRef = project['Frameworks'].new_file(lib_path);

# Get the build phase
#framework_buildphase = project.objects.select{|x| x.class == Xcodeproj::Project::Object::PBXFrameworksBuildPhase}[0];

# Add it to the build phase
# framework_buildphase.add_file_reference(libRef);

# Save the project
#project.save('DevProject.xcodeproj');


# Add test target with XCTest framework
test_target = project.new_target(Xcodeproj::Project::PBXNativeTarget)
#project.targets << test_target
test_target.name = project_name + 'Tests'
test_target.product_name = project_name + 'Tests'
test_target.product_type = 'com.apple.product-type.bundle.unit-test'
test_target.build_configuration_list = Xcodeproj::Project::ProjectHelper.configuration_list(project, :ios, IOS_VERSION)

# product_ref = project.products_group.new_reference(project_name + 'Tests.xctest', :built_products)
# product_ref.include_in_index = '0'
# product_ref.set_explicit_file_type
# test_target.product_reference = product_ref

test_target.build_phases << project.new(Xcodeproj::Project::PBXSourcesBuildPhase)
test_target.build_phases << project.new(Xcodeproj::Project::PBXFrameworksBuildPhase)
test_target.build_phases << project.new(Xcodeproj::Project::PBXResourcesBuildPhase)

# Add xctest framework manually because it's in a weird folder.
# group = project.frameworks_group['iOS'] || project.frameworks_group.new_group('iOS')
# path = "Library/Frameworks/XCTest.framework"
# unless ref = group.find_file_by_path(path)
#   ref = group.new_file(path, :developer_dir)
# end
# test_target.frameworks_build_phase.add_file_reference(ref, true)

# Add other targets.
test_target.add_system_frameworks(['UIKit', 'Foundation'])

# Add target dependency.
#test_target.add_dependency(target_for_testing)

# Special test build configs.
test_target.build_configuration_list.set_setting('WRAPPER_EXTENSION', 'xctest')
#test_target.build_configuration_list.set_setting('BUNDLE_LOADER', "$(BUILT_PRODUCTS_DIR)/#{target_for_testing.name}.app/#{target_for_testing.name}")
test_target.build_configuration_list.set_setting('TEST_HOST', '$(BUNDLE_LOADER)')

test_target.build_configuration_list.build_configurations.each do |bc|
	bc.build_settings['FRAMEWORK_SEARCH_PATHS'] = [
		'$(SDKROOT)/Developer/Library/Frameworks',
		'$(inherited)',
		'$(DEVELOPER_FRAMEWORKS_DIR)']
end

project.save('DevProject.xcodeproj');

# TODO normal build configs for that target.
# TODO add test classes to that target.