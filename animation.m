figure
Z = peaks;
surf(Z)
ax = gca;
ax.NextPlot = 'replaceChildren';


loops = 10;
F(loops) = struct('cdata',[],'colormap',[]);
for j = 1:loops
        X = sin(j*pi/10)*Z;
        surf(X,Z)
        drawnow
        F(j) = getframe;
        frame = getframe;
        im = frame2im(frame);
        [imind,cm] = rgb2ind(im,256);

        % Write to the GIF File 
        if j == 1
          imwrite(imind,cm,'test.gif','gif', 'Loopcount',inf);
        else
          imwrite(imind,cm,'test.gif','gif','WriteMode','append');
        end
end