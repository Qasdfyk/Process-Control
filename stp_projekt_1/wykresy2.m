figure;
plot(out.simout.time, out.simout.signals.values)
hold on
plot(out.simout1.time, out.simout1.signals.values)
plot(out.simout2.time, out.simout2.signals.values)
xlabel("t(s)")
ylabel("x  rzeczywiste")
legend("x1(t)","x2(t)","x3(t)")
hold off

figure;
plot(out.simout3.time, out.simout3.signals.values)
hold on
plot(out.simout4.time, out.simout4.signals.values)
plot(out.simout5.time, out.simout5.signals.values)
xlabel("t(s)")
ylabel("x  estymowane")
legend("x1(t)","x2(t)","x3(t)")
hold off