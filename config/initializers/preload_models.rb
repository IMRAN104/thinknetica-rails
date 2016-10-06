Dir.glob(Rails.root + 'app/models/**/*.rb').map do |file| 
  File.basename(file, '.*').camelize.constantize
end
