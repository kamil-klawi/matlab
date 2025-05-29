classdef Signal

    properties
        A
        fsig
        T
        phi
        fs
    end

    properties (Constant)
        func = @(A, fsig, T, phi) A .* sin(2 * pi .* fsig .* t + phi);
    end

    properties (Dependent)
        time
        signal
    end

    methods

        function obj = Signal(A, fsig, T, phi, fs)
            obj.A = A;
            obj.fsig = fsig;
            obj.T = T;
            obj.phi = phi;
            obj.fs = fs;
        end

        function t = get.time(obj)
            t = 0:1 / obj.fs:obj.T - (1 / obj.fs);
        end

        function s = get.signal(obj)
            s = sin(obj.A * pi * obj.fsig * obj.time + obj.phi);
        end

        function line = plot(obj)
            figure;
            line = plot(obj.time, obj.signal);
            grid on;
            ylabel("Wartości");
            xlabel("Czas t [s]");
            title("Przebieg czasowy");
        end

        function area = area(obj, method)
            if method == "prostokat"
                a = obj.signal;
                b = 1 / obj.fs;
                area = sum( a(1:end-1) * b );
            elseif method == "trapez"
                a = obj.signal;
                h = 1 / obj.fs;
                area = sum( a(1:end-1) * 0.5 * h );
            end
        end

    end
end