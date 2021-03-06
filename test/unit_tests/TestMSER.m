classdef TestMSER
    %TestMSER
    properties (Constant)
        path = fileparts(fileparts(mfilename('fullpath')))
        img = rgb2gray(imread([TestMSER.path,filesep,'img001.jpg']))
    end
    
    methods (Static)
        function test_1
            chains = cv.MSER(TestMSER.img);
        end
        
        function test_error_1
            try
                cv.MSER();
                throw('UnitTest:Fail');
            catch e
                assert(strcmp(e.identifier,'mexopencv:error'));
            end
        end
    end
    
end

