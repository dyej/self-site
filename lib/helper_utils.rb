
include FileUtils::Verbose

module HelperUtils
    def pdf_combine(params)
        pdf = CombinePDF.new

        params.keys.each do |key|
            p = params[key]
            if key.include? 'file' #&& !param[:filename].nil?          
                uploaded_file_path = save_param_file(p[:tempfile], p[:filename])
                pdf << CombinePDF.load("public/uploads/Associate.pdf", allow_optional_content: true)
            end
        end

        pdf.save "public/docs/combined.pdf"
    end

    def save_param_file(tempfile, filename)
        cp tempfile.path, "public/uploads/#{filename}"
        return "public/uploads/#{filename}"
    end
end