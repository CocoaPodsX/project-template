#!/usr/bin/env ruby

require 'fileutils'
require 'colored2'

module Pod
    module Extension
        class TemplateConfigurator

            attr_reader :template_url, :target_url, :project_name
            attr_reader :placeholder_project_name, :placeholder_name, :placeholder_email, :placeholder_date, :placeholder_year, :placeholder_bundleidname, :placeholder_bundleidlastname

            def initialize template_url, target_url, project_name
                @template_url = template_url
                @target_url = target_url
                @project_name = project_name

                @placeholder_name = '_name0x07'
                @placeholder_date = '_date0x07'
                @placeholder_year = '_year0x07'
                @placeholder_email = '_email0x07'
                @placeholder_project_name = '_Template_Project0x07'
                @placeholder_bundleidname = '-bundle-identifier-name-0x07'
                @placeholder_bundleidlastname = '-bundle-identifier-lastname-0x07'
            end

            def run
                copy_template!
                rename_filename 0
                rewrite_foreach_file 0
                run_pod_install
            end

            def copy_template!
                from = template_url
                to = target_url
                FileUtils.cp_r(from, to)
            end

            def rename_filename layer
                flag = false
                extname = "/*" * (layer + 1)
                Dir.glob(target_url + extname).each do |url|
                    from = url
                    to = url.gsub placeholder_project_name, project_name
                    File.rename(from, to)
                    flag = true
                end
                if flag
                    rename_filename layer + 1
                end
            end

            def rewrite_foreach_file layer
                flag = false
                extname = "/*" * (layer + 1)
                Dir.glob(target_url + extname).each do |url|
                    if File::file? url
                        rewrite_file url
                    end
                    flag = true
                end
                if flag 
                    rewrite_foreach_file layer + 1
                end
            end

            def rewrite_file url
                buffer = ''
                File.open url do |file| 
                    buffer = file.read
                end

                name = `git config --get user.name`
                if name.nil? or name.empty?
                    name = 'nameless'
                end

                email = `git config --get user.email`
                if email.nil? or email.empty?
                    email = 'nameless@email.com'
                end

                year = Time.new.strftime("%Y")
                date = Time.new.strftime("%m/%d/%y")

                buffer = buffer.gsub placeholder_project_name, project_name.chomp
                buffer = buffer.gsub placeholder_bundleidname, name.chomp
                buffer = buffer.gsub placeholder_bundleidlastname, project_name.chomp
                buffer = buffer.gsub placeholder_name, name.chomp
                buffer = buffer.gsub placeholder_email, email.chomp
                buffer = buffer.gsub placeholder_year, year.chomp
                buffer = buffer.gsub placeholder_date, date.chomp

                File.open url, "w" do |file|
                    file.write buffer
                end

            end

            def run_pod_install
                puts 'Running ' + 'pod install'.magenta + ' on your new library.'
                puts ''
                Dir.chdir(project_name) do
                    system 'pod install'
                    system 'open ./'
                end
            end

        end
    end
end