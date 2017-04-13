
include FileUtils::Verbose

module HelperUtils
    def pdf_combine(params)
        cmd = "pdftk "
        params.keys.each do |key|
            p = params[key]
            if key.include? 'file' #&& !param[:filename].nil?          
                cmd += p[:tempfile].path + " "
            end
        end
        cmd += "cat output public/uploads/merged.pdf"
        %x[ #{cmd} ]
        puts cmd
    end
end
