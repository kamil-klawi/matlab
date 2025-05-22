function [foundRoot] = findRoot(func, e, name, iterations)

arguments
    func function_handle
    e
    name string
    iterations (1,1) double {mustBePositive}
end

if name == "Falsi"
    for i = 1 : iterations
        f1 = func(e(1));
        f2 = func(e(2));
        foundRoot = e(1) - f1 * ((e(2) - e(1)) / (f2 - f1));
    
        if sign(func(foundRoot)) == sign(f1)
            e(1) = foundRoot;
        else
            e(2) = foundRoot;
        end
    end
elseif name == "Newton"
    foundRoot = e;
    deltaX = 1e-6;
    for i = 1 : iterations
        f_val = func(foundRoot);
        derivative = (func(foundRoot) - func(foundRoot + deltaX)) / -deltaX;
        foundRoot = foundRoot - f_val / derivative;
    end
end

end