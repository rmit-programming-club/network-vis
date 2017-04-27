rubocop_cmd = "rubocop --color --display-cop-names"

desc "Run rubocop"
task :rubocop do
  sh rubocop_cmd
end

namespace :rubocop do
  desc "runs the rubocop code analyzer the files you've changed compared with the integration branch"
  task :changed do

    global = YAML.load_file('.rubocop.yml').fetch('AllCops')
    in_files = global.fetch('Include')
    excluded_files = global.fetch('Exclude').map { |e| e.split("*", 2).first }
    modified = `git diff --name-only $(git merge-base HEAD master)`.split("\n")
    files = modified.select do |f|
      (f.end_with?(".rb") || in_files.include?(f)) &&
        !f.start_with?(*excluded_files) && File.exist?(f)
    end

    unless files.empty?
      sh "#{rubocop_cmd} #{files.join(" ")}"
    end
  end
