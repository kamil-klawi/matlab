function [s, t] = genSin(czas, Hz, sinHz)
t = 0:1/Hz:czas-1/Hz;
s = sin(2*pi*sinHz*t);
end