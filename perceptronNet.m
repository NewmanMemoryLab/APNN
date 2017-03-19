%A Perceptron to train a neural network... .

%x = [0 0 1 1; 0 1 0 1];
%t = [0 1 1 1];

[rasMid, tVec] = distroSpikeGen(2, 100, 0, 50);
[rasSide, tVec] = distroSpikeGen(2, 100, 50, 0);

x = rasMid; 
t = rasSide;

%Create the neural net
net = perceptron;

%Set the epochs 
net.trainParam.epochs = 1;

fprintf('iteration: ')
for i = 1:size(x, 1)
    if mod(i, 10) == 0; fprintf(num2str(i), ' '); end
net = train(net,x(i,:),t(i,:));
end

%net = train(net,x,t);
%view(net)


[rasMidTst, tVec] = distroSpikeGen(2, 1, 0, 50);

%y = net(x);
y = net(rasMidTst);

HeatMap(y)

