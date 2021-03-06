classdef TestCvtColor
    %TestCvtColor
    properties (Constant)
        path = fileparts(fileparts(mfilename('fullpath')))
        img = imread([TestCvtColor.path,filesep,'img001.jpg'])
    end
    
    methods (Static)
        function test_1
            result = cv.cvtColor(TestCvtColor.img, 'RGB2GRAY');
        end
        
        function test_2
            result = cv.cvtColor(TestCvtColor.img, 'RGB2GRAY', 'DstCn', 0);
        end
        
        function test_error_1
            try
                cv.cvtColor();
                throw('UnitTest:Fail');
            catch e
                assert(strcmp(e.identifier,'mexopencv:error'));
            end
        end
    end
    
end

