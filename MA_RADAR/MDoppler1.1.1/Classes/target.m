% Definition of target class
% Alexis González Argüello
classdef target   < handle
    properties 
        x
        y
        z
        vx
        vy
        vz
    end
    methods
        function obj= target(x,y,z,vx,vy,vz)
            % Targets are defined as static and at the origin
            if nargin == 0
                obj.x = 0; obj.y = 0; obj.z = 0;
                obj.vx =0; obj.vy =0; obj.vz = 0; 
            % Tagets that are not assigned a velocity are static
            elseif nargin == 3
                obj.x = x; obj.y = y; obj.z = z; 
                obj.vx = 0; obj.vy = 0; obj.vz = 0; 
            % Complete definition of a target
            elseif nargin == 6
                obj.x = x; obj.y = y; obj.z = z; 
                obj.vx = vx; obj.vy = vy; obj.vz = vz;
            else
                error('Please specify all the distance and/or velocity components'); 
            end
        end
        % function to move the object according to the time passed
        function obj = move(obj,time)
            obj.x = obj.x + obj.vx*time;
            obj.y = obj.y + obj.vy*time;
            obj.z = obj.z + obj.vz*time;
        end
        % function to plot the target
        function h = plot(obj)
            h = plot(obj.x,obj.y,'b*');
        end
        % it is assumed that the radar is located at the origin
        function vr = rangerate(obj)
           t1 = obj.x*obj.vx+obj.y*obj.vy+obj.z*obj.vz; 
           t2 = sqrt(obj.x^2+obj.y^2+obj.z^2); 
           vr = t1/t2; 
        end

    end
end 