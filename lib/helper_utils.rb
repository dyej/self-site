
include FileUtils::Verbose

module HelperUtils
    def pdf_combine(params)
        cmd = "pdftk "
        params.keys.each do |key|
            p = params[key]
            if key.include? 'file' #&& !param[:filename].nil?          
                uploaded_file_path = save_param_file(p[:tempfile], p[:filename])
                cmd += uploaded_file_path + " "
            end
        end
        cmd += "cat output public/uploads/merged.pdf"
        %x[ #{cmd} ]
        puts cmd
    end

    def save_param_file(tempfile, filename)
        cp tempfile.path, "public/uploads/#{filename}"
        return "public/uploads/#{filename}"
    end
end
