classdef DescriptorExtractor < handle
	%DESCRIPTOREXTRACTOR  DescriptorExtractor class
	%
	% Descriptor extractor class. Here is how to use:
	%
	%   extractor = cv.DescriptorExtractor('SURF');
	%   descriptors = extractor.compute(im, keypoints);
    %
    % See also cv.DescriptorExtractor.DescriptorExtractor
    % cv.DescriptorExtractor.compute
    %
    
    properties (SetAccess = private)
    	id
    end
    
    properties (SetAccess = private, Dependent)
        size
    	type
    end
    
    methods
        function this = DescriptorExtractor(type)
            %DESCRIPTOREXTRACTOR  DescriptorExtractor constructors
            %
            %  detector = cv.DescriptorExtractor(type)
            %
            % Input:
            %   type: Type of the detector. see below. default 'FAST'
            % Output:
            %   detector: New instance of the DescriptorExtractor
            %
            % The following extractor types are supported:
            %
            %     'SIFT'     SiftDescriptorExtractor
            %     'SURF'     SurfDescriptorExtractor
            %     'ORB'      OrbDescriptorExtractor
            %     'BRIEF'    BriefDescriptorExtractor
            %
            % Also a combined format with the following adaptor is
            % supported:
            %
            %     'Opponent' OpponentColorDescriptorExtractor
            %
            % for example: 'OpponentSIFT'.
            %
            % See also cv.DescriptorExtractor cv.DescriptorExtractor.write
            %
            if nargin < 1, type = 'SIFT'; end
            if ~ischar(type)
                error('DescriptorExtractor:error','Invalid type');
            end
            this.id = DescriptorExtractor_(type);
        end
        
        function delete(this)
            %DELETE  DescriptorExtractor destructor
            %
            % See also cv.DescriptorExtractor
            %
            DescriptorExtractor_(this.id, 'delete');
        end
        
        function s = get.size(this)
        	%SIZE  DescriptorExtractor size
        	s = DescriptorExtractor_(this.id, 'size');
        end
        
        function t = get.type(this)
        	%TYPE  DescriptorExtractor type
        	t = DescriptorExtractor_(this.id, 'type');
        end
        
        function descriptors = compute(this, im, keypoints)
            %COMPUTE  Computes the descriptors for a set of keypoints detected in an image
            %
            %   descroptors = extractor.compute(im, keypoints)
            %
            % Input:
            %   im: Image.
            %   keypoints: Input collection of keypoints. Keypoints for
            %       which a descriptor cannot be computed are removed.
            %       Sometimes new keypoints can be added, for example:
            %       SIFT duplicates keypoint with several dominant
            %       orientations (for each orientation).
            % Output:
            %   descriptors: Computed descriptors.
            %
            % See also cv.DescriptorExtractor
            %
            descriptors = DescriptorExtractor_(this.id, 'compute', im, keypoints);
        end
        
        function read(this, filename)
            %READ  Reads a descriptor extractor object from a file
            %
            %   extractor.read(filename)
            %
            % Input:
            %   filename: name of the xml/yaml file
            %
            % See also cv.DescriptorExtractor
            %
            DescriptorExtractor_(this.id, 'write', filename);
        end
        
        function write(this, filename)
            %WRITE  Writes a descriptor extractor object to a file
            %
            %   extractor.write(filename)
            %
            % Input:
            %   filename: name of the xml/yaml file
            %
            % See also cv.DescriptorExtractor
            %
            DescriptorExtractor_(this.id, 'write', filename);
        end
    end
    
end