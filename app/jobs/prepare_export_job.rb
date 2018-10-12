class PrepareExportJob < ApplicationJob
  include ActiveStorage::Downloading

  def perform(export)
    Dir.mktmpdir do |dir|
      export.kits.each do |kit|
        %i[box_art preview assembled_photo packaging_photo manual].each do |field|
          if kit.send(field).attached?
            IO.binwrite("#{dir}/#{kit.id}_#{field}.#{kit.send(field).filename.extension}", kit.send(field).download)
          end
        end
      end

      zip_file = "export_#{export.created_at.strftime('%Y%m%dT%H%M%S')}.zip"
      system('zip', '-rj', "#{dir}/#{zip_file}", dir)

      export.zip.attach(io: File.open("#{dir}/#{zip_file}"), filename: zip_file, content_type: 'application/zip')
    end
  end
end
