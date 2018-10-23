function [amplitude] = plot_and_amp(x,samples, amp_start)
    value=x(2,1:samples);
    time=x(1,1:samples);
    plot(time,value);
    max_v=max(value(amp_start:end));
    min_v=min(value(amp_start:end));
    amplitude = (max_v - min_v)/2;
end